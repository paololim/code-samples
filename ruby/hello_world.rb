
class HelloWorld
  attr_accessor :x
  attr_accessor :y
  
  def initialize(x, y)
    @x = x
    @y = y
  end
end

puts "Hello World!!!!!!!!"
a = HelloWorld.new(123, "Foo")
puts a.inspect

a.x = 987
a.y = "Bar"
puts a.inspect
