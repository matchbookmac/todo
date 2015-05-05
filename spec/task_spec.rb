require('spec_helper')

describe(Task) do
  describe('#description') do
    it('returns the description of a task instance') do
      test_task = Task.new({:description => 'learn SQL', :list_id => 1, :due_date => '2015-05-08', :id => nil})
      expect(test_task.description()).to(eq('learn SQL'))
    end
  end

  describe('#id') do
    it('will return the id of a specific task') do
      test_task = Task.new({:description => 'learn SQL', :list_id => 1, :due_date => '2015-05-08', :id => nil})
      test_task.save()
# binding.pry
      expect(test_task.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('.all') do
    it('return the array of all task objects') do
      expect(Task.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('save a task object to the array of task objects') do
      test_task = Task.new({:description => 'learn SQL', :list_id => 1, :due_date => '2015-05-08', :id => nil})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe('.clear') do
    it('removes all values from the array of tasks') do
      test_task = Task.new({:description => 'learn SQL', :list_id => 1, :due_date => '2015-05-08', :id => nil})
      test_task.save()
      Task.clear()
      expect(Task.all()).to(eq([]))
    end
  end

  describe('.sort_by_due') do
    it('returns an array of tasks sorted by their due date') do
      test_task_1 = Task.new({:description => 'learn Java', :list_id => 1, :due_date => '2015-06-08', :id => nil})
      test_task_1.save()
      test_task_2 = Task.new({:description => 'learn SQL', :list_id => 1, :due_date => '2015-05-08', :id => nil})
      test_task_2.save()
      test_task_3 = Task.new({:description => 'learn RAILS', :list_id => 1, :due_date => '2015-07-08', :id => nil})
      test_task_3.save()
      expect(Task.sort_by_due()).to(eq([test_task_2, test_task_1, test_task_3]))
    end
  end

  describe('#delete') do
    it('will delete a specific task') do
      test_task_1 = Task.new({:description => 'learn Java', :list_id => 1, :due_date => '2015-06-08', :id => nil})
      test_task_1.save()
      test_task_1.delete()
      expect(Task.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('returns true if the description of the tasks are the same') do
      test_task_1 = Task.new({:description => 'learn SQL', :list_id => 1, :due_date => '2015-05-08', :id => nil})
      test_task_2 = Task.new({:description => 'learn SQL', :list_id => 1, :due_date => '2015-05-08', :id => nil})
      expect(test_task_1).to(eq(test_task_2))
    end
  end


end
