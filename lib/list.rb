class List
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_lists = DB.exec("SELECT * FROM lists;")
    lists = []
    returned_lists.each() do |list|
      name = list.fetch("name")
      id = list.fetch("id").to_i()
      lists.push(List.new({:name => name, :id => id}))
    end
    lists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:find) do |id|
    result = DB.exec("SELECT * FROM lists WHERE id = #{id};")
    name = result.first().fetch('name')
    returned_list = List.new({:name => name, :id => id})
    returned_list
  end

  define_method(:tasks) do
    tasks = []
    @id = self.id().to_i()
    results = DB.exec("SELECT * FROM tasks WHERE list_id = #{@id};")
    results.each() do |result|
      description = result.fetch('description')
      due_date = result.fetch('due_date')
      task = Task.new({:description => description, :list_id => @id, :due_date => due_date})
      tasks.push(task)
    end
    tasks
  end

  define_method(:delete) do
    @id = self.id()
    DB.exec("DELETE FROM lists WHERE id = #{@id};")
    DB.exec("DELETE FROM tasks WHERE list_id = #{@id};")
  end

  define_method(:==) do |other_list|
    self.name().==(other_list.name()).&(self.id().==(other_list.id()))
  end

end
