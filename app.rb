require("sinatra")
require("sinatra/reloader")
require('pg')
require('pry')
also_reload("lib/**/*.rb")
require("./lib/list")
require("./lib/task")

DB = PG.connect({:dbname => 'todo_list'})

get("/") do
  @lists = List.all()
  erb(:index)
end

post('/list/add') do
  @name = params.fetch('name')
  new_list = List.new({:name => @name, :id => nil})
  new_list.save()
  erb(:success)
end

get('/list/:id') do
  @id = params.fetch('id')
  @list = List.find(@id)
  @tasks = @list.tasks()
  erb(:list)
end

get('/list/:id/task/add') do
  @id = params.fetch('id')
  @list = List.find(@id)
  erb(:task_form)
end

post('/list/:id/task/add') do
  @id = params.fetch('id')
  @list = List.find(@id)
  @description = params.fetch('description')
  @due_date = params.fetch('due_date')
  @task = Task.new({:description => @description, :list_id => @id, :due_date => @due_date})
  @task.save()
  erb(:success)
end
