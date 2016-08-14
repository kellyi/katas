#!/usr/bin/env scala

def sumEvenFibo(first: Int, second: Int, accumulator: Int): Int = {
    if (second >= 4000000) {
        return accumulator
    } else if (second % 2 == 0) {
        return sumEvenFibo(second, first + second, accumulator + second)
    } else {
        return sumEvenFibo(second, first + second, accumulator)
    }
}

println(sumEvenFibo(1, 2, 0))

