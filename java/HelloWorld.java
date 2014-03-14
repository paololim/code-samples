public class HelloWorld {

  private int x;
  private String y;

  public HelloWorld(int x, String y) {
    this.x = x;
    this.y = y;
  }

  public void setX(int x) {
    this.x = x;
  }

  public int getX() {
    return x;
  }

  public void setY(String y) {
    this.y = y;
  }

  public String getY() {
    return y;
  }
  
  @Override
  public String toString() {
    return "X: " + getX() + ", Y: " + getY();
  }
  
  public static void main(String args[]) {
    System.out.println("Hello World!!!!!!!!");
    for (int i = 0; i < 10; i++) {
      System.out.println(i);
    }
    
    HelloWorld a = new HelloWorld(123, "Foo");
    System.out.println(a);
    
    a.setX(987);
    a.setY("Bar");
    System.out.println(a);
  }

}