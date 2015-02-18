
class Node
  attr_accessor :value, :next
  
  def initialize(value)
    @value = value
    @next = nil
  end
end

class LinkedListStack
  attr_accessor :first, :count
  
  def initialize
    @first = nil
    @count = 0
  end
  
  def each
    curr = @first
    while !curr.nil?
      yield curr
      curr = curr.next
    end
  end
  
  def add(value)
    old_first = @first
    @first = Node.new(value)
    @first.next = old_first
    @count = @count + 1
  end
  
  def remove
    if @count > 0
      value = @first.value
      @first = @first.next
      @count = @count - 1
      value
    end
  end
  
  def reverse_in_place
    prev = nil
    curr = @first
    
    while !curr.nil?
      next_node = curr.next
      curr.next = prev
      prev = curr
      curr = next_node
    end
    
    @first = prev
  end
end

stack = LinkedListStack.new
stack.add("Hello")
stack.add("World")
stack.add("Foo")
stack.add("Bar")
stack.remove
stack.remove
stack.add("See")
stack.add("You")
stack.add("Later")
stack.remove
stack.each{|x| puts x.value}
stack.reverse_in_place
stack.each{|x| puts x.value}
