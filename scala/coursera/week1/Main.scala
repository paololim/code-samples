package recfun
import common._

object Main {
  def main(args: Array[String]) {
    println("Pascal's Triangle")
    for (row <- 0 to 10) {
      for (col <- 0 to row)
        print(pascal(col, row) + " ")
      println()
    }
  }

  /**
   * Exercise 1
   */
  def pascal(c: Int, r: Int): Int =
    if (c < 0 || c > r) 0
    else if (c == 0 || c == r) 1
    else pascal(c-1,r-1) + pascal(c,r-1)

  /**
   * Exercise 2
   */
  def balance(chars: List[Char]): Boolean = {
    def f(chars: List[Char], parens: List[Char]): Boolean =
      if (chars.size == 0) parens.isEmpty
      else if (chars.head == '(') f(chars.tail, '('::parens)
      else if (chars.head == ')')
        if (parens.isEmpty || parens.head != '(')
          f(chars.tail, ')'::parens)
        else
          f(chars.tail, parens.tail)
      else f(chars.tail, parens)
    f(chars, List[Char]())
  }

  /**
   * Exercise 3
   */
  def countChange(money: Int, coins: List[Int]): Int =
    if (money == 0 && !coins.isEmpty) 1
    else if (money < 0 || coins.isEmpty) 0
    else countChange(money-coins.head, coins) + countChange(money, coins.tail)
}