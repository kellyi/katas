#!/usr/bin/env python
# http://rosettacode.org/wiki/Ludic_numbers

def ludics(n):
    ludics = [1]
    base = [i for i in xrange(2,n**2)]
    while len(ludics) < n:
        ludics.append(base[0])
        base = [x for ind, x in enumerate(base) if ind % base[0] != 0]
    return ludics

print ludics(25)
