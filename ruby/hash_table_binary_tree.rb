
class Node
  attr_accessor :key, :value, :left_child, :right_child
  
  def initialize(key, value)
    @key = key
    @value = value
    @left_child = nil
    @right_child = nil
  end
end

class BinaryTree
  def initialize
    @root = nil
  end
  
  def add(key, value)
    @root = add_at_node(@root, key, value)
  end
  
  def add_at_node(node, key, value)
    if node.nil?
      return Node.new(key, value)
    else
      if key <= node.key
        node.left_child = add_at_node(node.left_child, key, value)
      else
        node.right_child = add_at_node(node.right_child, key, value)
      end
      return node
    end
  end
  
  def find(key)
    find_at_node(@root, key)
  end
  
  def find_at_node(node, key)
    if node.nil?
      return nil
    else
      if node.key == key
        return node.value
      elsif key <= node.key
        return find_at_node(node.left_child, key)
      else
        return find_at_node(node.left_child, key)
      end
    end
  end
end

class HashTableBinaryTree
  attr_accessor :trees
  
  def initialize
    @trees = []
  end
  
  def compute_index(key)
    key.to_s.to_sym.object_id % 100
  end
  
  def insert(key, value)
    index = compute_index(key)
    trees[index] = BinaryTree.new unless trees[index]
    trees[index].add(key, value)
  end
  
  def find(key)
    index = compute_index(key)
    return trees[index].find(key)
  end
end

table = HashTableBinaryTree.new
table.insert("A", "a")
table.insert("B", "b")
table.insert("C", "c")
table.insert("D", "d")

table.find("A")
table.find("B")
table.find("C")
table.find("D")