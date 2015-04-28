require('rspec')
require('todo')

describe(Todo) do
  describe("#description") do
    it("lets you give it a description") do
      test_task = Todo.new("scrub the zebra")
      expect(test_task.description()).to(eq("scrub the zebra"))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Todo.new("wash the lion")
      test_task.save()
      expect(Todo.all()).to(eq([test_task]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved tasks") do
      Todo.new("wash the lion").save()
      Todo.clear()
      expect(Todo.all()).to(eq([]))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Todo.all()).to(eq([]))
    end
  end

end
