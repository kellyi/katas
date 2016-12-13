#!/usr/bin/env scala

def balancedBrackets(s: String, i: Int = 0, r: Int = 0, l: Int = 0): Boolean = {
  if (r < l) {
    false
  } else if (i == s.length) {
    r == l
  } else if (s(i).toString == "[") {
    balancedBrackets(s, i + 1, r + 1, l)
  } else if (s(i).toString == "]") {
    balancedBrackets(s, i + 1, r, l + 1)
  } else {
    balancedBrackets(s, i + 1, r, l)
  }
}

val none = "" // True
val one = "[]" // True
val two = "][" // False
val three = "[][]" // True
val four = "][][" // False
val five = "[[][]]" // True
val six = "[]][[]" // False

println(balancedBrackets(none))
println(balancedBrackets(one))
println(balancedBrackets(two))
println(balancedBrackets(three))
println(balancedBrackets(four))
println(balancedBrackets(five))
println(balancedBrackets(six))

