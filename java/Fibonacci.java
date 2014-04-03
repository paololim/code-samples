/**
 * 
 * @author plim
 *
 * Simple Fibonacci number functions
 */
public class Fibonacci {
  public static int recursive(int n) {
    if (n <= 2) {
      return 1;
    } else {
      return recursive(n-1) + recursive(n-2);
    }
  }
  
  public static int interative(int n) {
    if (n <= 2) {
      return 1;
    }

    int first = 1;
    int second = 1;
    int third = 0;
    
    for (int i = 3; i <= n; i++) {
      third = first + second;
      first = second;
      second = third;
    }
    return third;
  }
  
  public static void main(String args[]) {
    // recursive
    System.out.println("Recursive Printout:");
    for (int i = 1; i <= 10; i++) {
      System.out.println(i + ": " + recursive(i));
    }
    
    // iterative
    System.out.println("Iterative Printout:");
    for (int i = 1; i <= 10; i++) {
      System.out.println(i + ": " + interative(i));
    }
  }
}