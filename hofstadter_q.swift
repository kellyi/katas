#!/usr/bin/env swift
// http://rosettacode.org/wiki/Hofstadter_Q_sequence

var cache = [1: 1, 2: 1]
func hofstadterQSeq(n: Int) -> Int {
    if cache[n] != nil {
        return cache[n]!
    } else {
        let first = hofstadterQSeq(n - hofstadterQSeq(n - 1))
        let second = hofstadterQSeq(n - hofstadterQSeq(n - 2))
        cache[n] = first + second
        return cache[n]!
    }
}

for n in 1...10 {
    print(hofstadterQSeq(n))
}
print(hofstadterQSeq(1000))
