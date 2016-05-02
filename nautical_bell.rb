#!/usr/bin/env ruby
# http://rosettacode.org/wiki/Nautical_bell

def nautical_bell(time=nil)
    number = 0
    if !time
        time = Time.now
        time = {'hour' => time.hour, 'min' => time.min}
    end
    4.downto(0).each do |h|
        if time['hour'] % h == 0
            number += h * 2
            break
        end
    end
    if time['min'] == 30
        number += 1
    elsif time['min'] != 0
        number = 0
    end
    number -= 8 if number > 8
    number.times do
        system "echo '\a'"
        sleep(0.25)
    end
end

while true
    print Time.now
    nautical_bell
    sleep(45)
end
