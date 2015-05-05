require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

DB = PG.connect({:dbname => 'todo_list_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
    DB.exec("DELETE FROM lists *;")
  end
end

describe('the to_do list path', {:type => :feature}) do
  it('the user visiting the homepage') do
    visit('/')
    expect(page).to have_content('You don\'t have any lists right now!')
  end

  it('will allow the user to create a list') do
    visit('/')
    fill_in('name', :with => 'groceries')
    click_button('Add')
    expect(page).to have_content('Your list: groceries has been added')
    click_link('I\'d like to view or create a list')
    expect(page).to have_content('Here is your to do list:')
    expect(page).to have_content('groceries')
  end

  it('will allow the user to access an already created list') do
    visit('/')
    fill_in('name', :with => 'groceries')
    click_button('Add')
    visit('/')
    click_on('groceries')
    expect(page).to have_content('groceries')
  end

  it('will allow the user to add tasks to a list') do
    visit('/')
    fill_in('name', :with => 'groceries')
    click_button('Add')
    visit('/')
    click_on('groceries')
    expect(page).to have_content('groceries')
    click_on('Add Task')
    fill_in('description', :with => 'apples')
    fill_in('due_date', :with => '2015-05-08')
  end
end
