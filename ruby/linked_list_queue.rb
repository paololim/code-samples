
class Node
  attr_accessor :value, :next
  
  def initialize(value)
    @value = value
    @next = nil
  end
end

class LinkedListQueue
  attr_accessor :first, :last, :count
  
  def initialize
    @first = nil
    @last = nil
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
    old_last = @last
    @last = Node.new(value)
    
    if @count == 0
      @first = @last
    else
      old_last.next = @last
    end
    @count = @count + 1
  end
  
  def remove
    return if @count == 0
    value = @first.value
    @first = @first.next
    @count = @count - 1
    return value
  end
  
  def reverse_in_place
    prev = nil
    curr = @first
    @last = curr
    
    while !curr.nil?
      next_node = curr.next
      curr.next = prev
      prev = curr
      curr = next_node
    end
    
    @first = prev
  end
end

queue = LinkedListQueue.new
queue.add("Hello")
queue.add("World")
queue.add("Foo")
queue.add("Bar")
queue.remove
queue.remove
queue.add("See")
queue.add("You")
queue.add("Later")
queue.remove
queue.each{|x| puts x.value}
queue.reverse_in_place
queue.each{|x| puts x.value}
