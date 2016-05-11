#!/usr/bin/env swift
// https://programmingpraxis.com/2016/05/10/concatenate-n-n-times/

func concatenateNNtimes(n: Int) -> String {
    return [String](count: n, repeatedValue: String(n)).joinWithSeparator("")
}

print(concatenateNNtimes(12))
