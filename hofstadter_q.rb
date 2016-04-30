#!/usr/bin/env ruby
# http://rosettacode.org/wiki/Hofstadter_Q_sequence

@cache = { 1 => 1, 2 => 1}
def hofst_q(n)
    return @cache[n] if @cache[n]
    @cache[n] = hofst_q(n - hofst_q(n - 1)) + hofst_q(n - hofst_q(n - 2))
end

(1..10).each { |n| p hofst_q(n) }
p hofst_q(1000)
