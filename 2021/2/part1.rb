# frozen_string_literal: true

input = File.read('input.txt').split("\n")

h = 0
d = 0

input.each do |val|
  direction, units = val.split(' ')

  case direction
  when 'forward'
    h += units.to_i
  when 'down'
    d += units.to_i
  when 'up'
    d -= units.to_i
  end
end

p h * d

