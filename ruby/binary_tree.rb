
class Node
  attr_accessor :value, :left_child, :right_child
  
  def initialize(value)
    @value = value
    @left_child = nil
    @right_child = nil
  end
end

class BinaryTree
  def initialize
    @root = nil
  end
  
  # value should enter at the root, then go down
  def add(value)
    @root = add_at_node(@root, value)
  end
  
  # add a value to the tree anchored at a node
  def add_at_node(node, value)
    if node == nil
      return Node.new(value)
    else
      if value <= node.value
        node.left_child = add_at_node(node.left_child, value)
      else
        node.right_child = add_at_node(node.right_child, value)
      end
      return node
    end
  end
  
  # Get a list of a list of all nodes at each depth
  # Modified breadth-first traversal with queues
  def get_list_of_lists
    # placeholder for all the list of lists we will return
    list_of_lists = []
    
    # initialize list and assume root is available
    current_list = []
    current_list << @root
    
    # look at current level - do we have anything to see?
    while !current_list.empty?
      # for the next level items, we don't want to touch those yet
      list_for_next_level = []
      
      # list of nodes we are able to find at this level
      list_at_this_level = []
      
      # now iterate through all the items at this level
      while !current_list.empty?
        node = current_list.shift
        list_at_this_level << node.value
        list_for_next_level << node.left_child if node.left_child
        list_for_next_level << node.right_child if node.right_child
      end
      
      # add the list at this level to the return list
      list_of_lists << list_at_this_level
      
      # update current list being seen with the list of the next level
      current_list = list_for_next_level
    end
    
    return list_of_lists
  end
end

tree = BinaryTree.new
tree.add(20)
tree.add(10)
tree.add(30)
tree.add(5)
tree.add(4)
tree.add(15)
tree.add(25)
tree.add(35)
tree.add(23)
tree.add(27)
tree.add(37)
puts tree.get_list_of_lists.inspect
