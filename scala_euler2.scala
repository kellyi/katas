type Even = Right[Nothing, Int]
type Odd = Left[Int, Nothing]
def Even(n: Int) = Right(n)
def Odd(n: Int) = Left(n)

def isEven(n: Int): Boolean = (n & 1) == 0

def generate(limit: Int, list: List[Int] = List.empty): List[Int] = list match {
  case a :: rest if (a > limit) => rest
  case a :: b :: rest => generate(limit, a + b :: a :: b :: rest)
  case _ => generate(limit, List(2, 1))
}

val result = generate(4000000)
  .map {
    case v if (isEven(v)) => Even(v)
    case v => Odd(v)
  }
  .fold(0) {
    case (acc: Int, Right(n: Int)) => acc + n
    case (acc, _) => acc
  }

println(result)
