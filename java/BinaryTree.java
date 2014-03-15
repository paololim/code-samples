/**
 * 
 * @author plim
 *
 * Simple binary tree implementation
 */
import java.util.*;

public class BinaryTree<T extends Comparable<T>> {
  Node<T> root;

  public void add(T value) {
    this.root = add(root, value);
  }

  // Simple add a new node to the binary tree
  private Node<T> add(Node<T> node, T value) {
    if (node == null) {
      return new Node<T>(value);
    } else {
      if (value.compareTo(node.value) <= 0) {
        node.leftChild = add(node.leftChild, value);
      } else {
        node.rightChild = add(node.rightChild, value);
      }
      return node;
    }
  }

  // Get a list of a list of all nodes at each depth
  // Modified breadth-first traversal with queues
  public List<List<T>> getListOfLists() {
    // initial stuff we will need
    List<List<T>>listOfLists = new LinkedList<List<T>>();
    
    // initialize the queue and assume the root is available
    Queue<Node<T>> currentQueue = new LinkedList<Node<T>>();
    currentQueue.add(root);
    
    // iterate by picking stuff off the queue, if there are still ones
    while (!currentQueue.isEmpty()) {
      // for the next level items, we don't want to touch those yet
      Queue<Node<T>> nextQueue = new LinkedList<Node<T>>();
      
      // list of the nodes we are able to find at this level
      List<T> list = new LinkedList<T>();
      
      while (!currentQueue.isEmpty()) {
        // get queue item, add to list
        Node<T> node = currentQueue.remove();
        list.add(node.value);
        
        // add left/right children if available to next queue
        if (node.leftChild != null) nextQueue.add(node.leftChild);
        if (node.rightChild != null) nextQueue.add(node.rightChild);
      }
      
      // add the list at this depth to the list of lists
      listOfLists.add(list);
      
      // update current queue being seen with the queue of the next level
      currentQueue = nextQueue;
    }
    
    return listOfLists;
  }
  
  // blah blah blah client
  public static void main(String args[]) {
    BinaryTree<Integer> tree = new BinaryTree<Integer>();
    tree.add(20);
    tree.add(10);
    tree.add(30);
    tree.add(5);
    tree.add(4);
    tree.add(15);
    tree.add(25);
    tree.add(35);
    tree.add(23);
    tree.add(27);
    tree.add(37);

    System.out.println(tree.getListOfLists());
    System.out.println("DONE!");
  }
}

class Node<T> {
  T value;
  Node<T> leftChild;
  Node<T> rightChild;
  
  public Node(T value) {
    this.value = value;
    this.leftChild = null;
    this.rightChild = null;
  }
}