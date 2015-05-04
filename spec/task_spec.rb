require('rspec')
require('task')

describe(Task) do
  describe('#description') do
    it('returns the description of a task instance') do
      test_task = Task.new('learn SQL')
      expect(test_task.description()).to(eq('learn SQL'))
    end
  end
end
