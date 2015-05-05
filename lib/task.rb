class Task
  attr_reader(:description, :list_id, :due_date, :id)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @list_id = attributes.fetch(:list_id)
    @due_date = attributes.fetch(:due_date)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_tasks = DB.exec("SELECT * FROM tasks;")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch("description")
      list_id = task.fetch("list_id").to_i()
      due_date = task.fetch("due_date")
      id = task.fetch("id")
      tasks.push(Task.new({:description => description, :list_id => list_id, :due_date => due_date, :id => id}))
    end
    tasks
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO tasks (description, list_id, due_date) VALUES ('#{@description}', #{@list_id}, '#{@due_date}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_singleton_method(:clear) do
    DB.exec("DELETE FROM tasks *;")
  end

  define_method(:==) do |another_task|
    self.description().==(another_task.description())
  end

  define_singleton_method(:sort_by_due) do
    returned_tasks = DB.exec("SELECT * FROM tasks ORDER BY due_date;")
    tasks = []
    returned_tasks.each() do |task|
      description = task.fetch("description")
      list_id = task.fetch("list_id").to_i()
      due_date = task.fetch("due_date")
      id = task.fetch("id").to_i()
      tasks.push(Task.new({:description => description, :list_id => list_id, :due_date => due_date, :id => id}))
    end
    tasks
  end

  define_method(:delete) do
    @id = self.id()
    DB.exec("DELETE FROM tasks WHERE id = #{@id}")
  end

end
