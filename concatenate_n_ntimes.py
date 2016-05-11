#!/usr/bin/env python
# https://programmingpraxis.com/2016/05/10/concatenate-n-n-times/

def concatenate_n_ntimes(n):
    return "".join([str(n) for i in xrange(0,n)])

print(concatenate_n_ntimes(12))
