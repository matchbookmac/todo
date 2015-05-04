class Task
  attr_reader(:description)

  define_method(:initialize) do |description|
    @description = description
  end

end
