#!/usr/bin/env ruby
# https://programmingpraxis.com/2016/05/10/concatenate-n-n-times/

def concatenate_n_ntimes(n)
  return n.to_s * n
end

p concatenate_n_ntimes(12)
