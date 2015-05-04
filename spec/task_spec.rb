require('spec_helper')

describe(Task) do
  describe('#description') do
    it('returns the description of a task instance') do
      test_task = Task.new({:description => 'learn SQL', :list_id => 1})
      expect(test_task.description()).to(eq('learn SQL'))
    end
  end

  describe('.all') do
    it('return the array of all task objects') do
      expect(Task.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('save a task object to the array of task objects') do
      test_task = Task.new({:description => 'learn SQL', :list_id => 1})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe('.clear') do
    it('removes all values from the array of tasks') do
      test_task = Task.new({:description => 'learn SQL', :list_id => 1})
      test_task.save()
      Task.clear()
      expect(Task.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('returns true if the description of the tasks are the same') do
      test_task_1 = Task.new({:description => 'learn SQL', :list_id => 1})
      test_task_2 = Task.new({:description => 'learn SQL', :list_id => 1})
      expect(test_task_1).to(eq(test_task_2))
    end
  end


end
