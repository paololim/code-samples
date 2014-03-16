/**
 * 
 * @author plim
 *
 * Simple implementation of a queue using a linked list
 */
import java.util.Iterator;

public class LinkedListStack<T> implements Iterable<T> {
  private Node first;
  private int count;

  class Node {
    T value;
    Node next;
    
    public Node(T value) {
      this.value = value;
      this.next = null;
    }
  }
  
  public boolean isEmpty() {
    return (first == null);
  }
  
  public int size() {
    return count;
  }

  public LinkedListStack() {
    this.first = null;
    this.count = 0;
  }
  
  // push
  public void add(T value) {
    Node oldFirst = first;
    first = new Node(value);
    first.next = oldFirst;
    count++;
  }
  
  // pop
  public T remove() {
    T value = first.value;
    first = first.next;
    count--;
    return value;
  }
  
  public Iterator<T> iterator() {
    return new ListIterator();
  }
  
  private class ListIterator implements Iterator<T> {
    private Node current = first;
    
    public boolean hasNext() {
      return (current != null);
    }
    
    public void remove() { }
    
    public T next() {
      T value = current.value;
      current = current.next;
      return value;
    }
  }
  
  public static void main(String args[]) {
    LinkedListStack<String> stringStack = new LinkedListStack<String>();
    stringStack.add("Hello");
    stringStack.add("World");
    stringStack.add("Foo");
    stringStack.add("Bar");
    System.out.println("Popped: " + stringStack.remove());
    System.out.println("Popped: " + stringStack.remove());
    stringStack.add("See");
    stringStack.add("You");
    stringStack.add("Later");
    System.out.println("Popped: " + stringStack.remove());
    
    System.out.println("Printing out the stack now:");
    for (String s: stringStack) {
      System.out.println("Element: " + s);
    }
  }
}
