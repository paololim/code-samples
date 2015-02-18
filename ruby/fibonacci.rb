
class Fibonacci
  def self.recursive(n)
    if n <= 2
      return 1
    else
      return recursive(n-1) + recursive(n-2)
    end
  end
  
  def self.iterative(n)
    if n <= 2
      return 1
    end
    
    first = 1
    second = 1
    third = 0
    
    3.upto(n) do |i|
      third = first + second
      first = second
      second = third
    end
    
    return third
  end
end

# recursive
1.upto(10) do |n|
  puts Fibonacci.recursive(n)
end

# iterative
1.upto(10) do |n|
  puts Fibonacci.iterative(n)
end
