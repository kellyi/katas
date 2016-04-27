#!/usr/bin/env ruby
# https://programmingpraxis.com/2016/04/26/an-integer-formula-for-fibonacci-numbers/

fibo = -> n {(4<<n*(3+n))/((4<<2*n)-(2<<n)-1)&((2<<n)-1)}
(1..25).each {|n| p fibo[n] }
