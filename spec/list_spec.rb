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

  describe('#save') do
    it('save a list to the database') do
      test_list = List.new({:name => 'stuff', :id => nil})
      test_list.save()
      expect(List.all()).to(eq([test_list]))
    end
  end

  describe('#id') do
    it('sets the object id when it is saved') do
      test_list = List.new({:name => 'stuff', :id => nil})
      test_list.save()
      expect(test_list.id()).to(be_an_instance_of(Fixnum))
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
