require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative '/home/ec2-user/environment/Launch-School/RB130/Lesson-1/todo_list.rb'


class TodoListTest < MiniTest::Test
  
  def setup
    @todo1 = Todo.new('Buy milk')
    @todo2 = Todo.new('Clean room')
    @todo3 = Todo.new('Go to gym')
    @todos = [@todo1, @todo2, @todo3]
    
    @list = TodoList.new('Todays Todos')
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end
  
  def test_to_a
    assert_equal(@todos, @list.to_a)
  end
  
  def test_size
    assert_equal(3, @list.size)
  end
  
  def test_first
    assert_equal(@todo1, @list.first, 'The first todo object stored in list was not returned')
  end
  
  def test_last
    assert_equal(@todo3, @list.last, 'The last todo object stored in the list was not returned')
  end
  
  def test_shift
    todo = @list.shift
    assert(@todo1 == todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end
  
  def test_pop
    todo = @list.pop
    assert(@todo3 == todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end
  
  def test_done?
    assert_equal(false, @list.done?)
  end
  
  def test_typeerror_raised_when_todo_list_has_non_todo_object_present
    assert_raises(TypeError) { @list << 'test string' }
  end
  
  def test_shovel_method
    @list << Todo.new('eat ass')
    assert_equal(4, @list.size)
  end
  
  def test_add
    @list.add(Todo.new('eat ass'))
    assert_equal(4, @list.size)
  end
  
  def test_item_at
    assert_equal(@todo2, @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(3) }
  end
  
  def test_mark_done_at?
    @list.mark_done_at(1)
    assert(@todo2.done?, 'Todo item has not been marked as done')
    assert_equal(false, @todo1.done?)
    assert_raises(IndexError) { @list.mark_done_at(100) }
  end
  
  def test_mark_undone_at?
    @list.done!
    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
  end
  
  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert(@list.done?)
  end
  
  def test_remove_at
    todo = @list.remove_at(0)
    assert_equal(@todo1, todo)
    assert_raises(IndexError) { @list.remove_at(100) }
  end
  
  def test_to_s
    @list.done!
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Todays Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end
  
  def test_each
    result = []
    @list.each{ |todo| result << todo }
    assert_equal(@todos, result)
  end
  
  def test_each_returns_calling_object
    assert_same(@list, @list.each {|todo| nil})
  end
  
  def test_select
    selection = @list.select { |todo| todo.title == 'Buy milk' }
    assert_instance_of(TodoList, selection, 'Value is not a TodoList object')
    assert_equal(1, selection.size)
  end
    
end