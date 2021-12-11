# frozen_string_literal: true

input = File.read('input.txt').split("\n")

a = 0
h = 0
d = 0

input.each do |val|
  direction, units_str = val.split(' ')
  units = units_str.to_i

  case direction
  when 'forward'
    h += units
    d += a * units
  when 'down'
    a += units
  when 'up'
    a -= units
  end
end

p h * d

