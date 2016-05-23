// sum all multiples of 3 & 5 below 1000

def isMultipleOfXorY(n: Int, x: Int, y: Int): Boolean = {
    return (n % x == 0) || (n % y == 0)
}

def sumMultiplesOfXAndYBelow(x: Int, y: Int, below: Int): Int = {
    val multiples = (1 to below-1) filter { isMultipleOfXorY(_, x, y) }
    return multiples.reduceLeft(_+_)
}

println(sumMultiplesOfXAndYBelow(3, 5, 1000))
