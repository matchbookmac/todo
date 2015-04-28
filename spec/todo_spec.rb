require('rspec')
require('todo')

describe(Todo) do
  describe("#description") do
    it("lets you give it a description") do
      test_task = Todo.new("scrub the zebra")
      expect(test_task.description()).to(eq("scrub the zebra"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Todo.all()).to(eq([]))
    end
  end
end
