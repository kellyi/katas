#!/usr/bin/env python
# http://rosettacode.org/wiki/Balanced_brackets

def balanced(s):
    left_count = 0
    right_count = 0
    for i in xrange(0,len(s)):
        if s[i] == '[':
            left_count += 1
        elif s[i] == ']':
            right_count += 1
        if left_count < right_count:
            return False
    return left_count == right_count


none = "" # True
one = "[]" # True
two = "][" # False
three = "[][]" # True
four = "][][" # False
five = "[[][]]" # True
six = "[]][[]" # False

for s in [none,one,two,three,four,five,six]:
    print(s, balanced(s))
