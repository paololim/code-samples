public class LinkedListQueue<T> {
  private Node head;
  private Node rear;

  class Node {
    T value;
    Node next;
  }

  public LinkedListQueue() {
    // do something with constructor
  }
  
  public void add(T value) {
    // add a new node to the rear of the queue
  }
  
  public T remove() {
    // return the head of the queue
    return head.value;
  }
  
  public static void main(String args[]) {
    System.out.println("Hello World!");
  }
}
