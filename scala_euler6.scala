#!/usr/bin/env scala

def square(x: Int): Int = {
    return x * x
}

def sum(l: List[Int]): Int = {
    return l.reduce(_ + _)
}

def squareSum(input: List[Int]): Int = {
    return square(sum(input))
}

def sumSquares(input: List[Int]): Int = {
    return sum(input.map(x => square(x)))
}

println(squareSum(List.range(1,101)) - sumSquares(List.range(1,101)))

