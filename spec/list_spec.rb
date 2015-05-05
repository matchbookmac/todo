require('spec_helper')

describe(List) do
  describe('.all') do
    it('returns an empty array when there are no lists') do
      expect(List.all()).to(eq([]))
    end
  end

  describe('#name') do
    it('returns the name of a list') do
      test_list = List.new({:name => 'stuff', :id => nil})
      expect(test_list.name()).to(eq('stuff'))
    end
  end

  describe('#id') do
    it('sets the object id when it is saved') do
      test_list = List.new({:name => 'stuff', :id => nil})
      test_list.save()
      expect(test_list.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#save') do
    it('save a list to the database') do
      test_list = List.new({:name => 'stuff', :id => nil})
      test_list.save()
      expect(List.all()).to(eq([test_list]))
    end
  end

  describe('.find') do
    it('will return a list based on its id') do
      test_list = List.new({:name => 'stuff', :id => nil})
      test_list.save()
      test_list_2 = List.new({:name => 'things', :id => nil})
      test_list_2.save()
      expect(List.find(test_list_2.id())).to(eq(test_list_2))
    end
  end

  describe('#tasks') do
    it('will return an array of the tasks for a given list') do
      test_list = List.new({:name => 'stuff', :id => nil})
      test_list.save()
      test_task = Task.new({:description => 'complete to do app', :list_id => test_list.id(), :due_date => '2015-05-08'})
      test_task.save()
      test_task_2 = Task.new({:description => 'learn SQL', :list_id => test_list.id(), :due_date => '2015-05-08'})
      test_task_2.save()
      expect(test_list.tasks()).to(eq([test_task, test_task_2]))
    end
  end

  describe("#==") do
    it('verifies if two lists are the same') do
      list1 = List.new({:name => "Epicodus stuff", :id => nil})
      list2 = List.new({:name => "Epicodus stuff", :id => nil})
      expect(list1).to(eq(list2))
    end
  end


end
