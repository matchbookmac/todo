require('rspec')
require('pg')
require('task')
require('list')
require('pry')

DB = PG.connect({:dbname => 'todo_list_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *;")
    DB.exec("DELETE FROM lists *;")
  end
end
