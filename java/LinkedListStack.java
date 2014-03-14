public class LinkedListStack<T> {
  private Node top;

  class Node {
    T value;
    Node next;
  }

  public LinkedListStack() {
    // do something with constructor
  }
  
  public void push(T value) {
    // push a new node with value
  }
  
  public T pop() {
    // return the top node's value
    return top.value;
  }
  
  public static void main(String args[]) {
    System.out.println("Hello World!");
  }
}
