/**
 * 
 * @author plim
 *
 * Simple implementation of a queue using a linked list
 */
import java.util.Iterator;

public class LinkedListQueue<T> implements Iterable<T>{
  private Node first;
  private Node last;
  private int count;

  class Node {
    T value;
    Node next;
    
    public Node(T value) {
      this.value = value;
      this.next = null;
    }
  }

  public LinkedListQueue() {
    this.first = null;
    this.last = null;
    this.count = 0;
  }
  
  public boolean isEmpty() {
    return (first == null || last == null);
  }
  
  public int size() {
    return count;
  }
  
  // enqueue
  public void add(T value) {
    Node oldLast = last;
    last = new Node(value);
    if (isEmpty()) {
      first = last;
    } else {
      oldLast.next = last;
    }
    count++;
  }
  
  // dequeue
  public T remove() {
    if (isEmpty()) {
      return null;
    }
    T value = first.value;
    first = first.next;
    count--;
    if (isEmpty()) {
      last = first;
    }
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
    LinkedListQueue<String> stringQueue = new LinkedListQueue<String>();
    stringQueue.add("Hello");
    stringQueue.add("World");
    stringQueue.add("Foo");
    stringQueue.add("Bar");
    System.out.println("Dequeued: " + stringQueue.remove());
    System.out.println("Dequeued: " + stringQueue.remove());
    stringQueue.add("See");
    stringQueue.add("You");
    stringQueue.add("Later");
    System.out.println("Dequeued: " + stringQueue.remove());
    
    System.out.println("Printing out the queue now:");
    for (String s: stringQueue) {
      System.out.println("Element: " + s);
    }
  }
}
