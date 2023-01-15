require 'pry'
require 'pp'
require 'set'

instructions = File.read('./input.txt').split("\n").map { |i| i.split(' ') }

x = 1
cycle = 0
row = 0
screen = ''
sprite = [0, 1, 2]

def set_sprite(x, row, sprite)
  sprite[1] = (x + row)
  sprite[0] = sprite[1] - 1
  sprite[2] = sprite[1] + 1
end

def screen_char(sprite, cycle)
  sprite.include?(cycle - 1) ? '#' : '.'
end

instructions.each do |instruction|
  if instruction.first == 'noop'
    cycle += 1

    row = cycle - 1 if ((cycle - 1) % 40).zero?
    set_sprite(x, row, sprite)
    screen << screen_char(sprite, cycle)
    next
  end

  2.times do
    cycle += 1

    row = cycle - 1 if ((cycle - 1) % 40).zero?
    set_sprite(x, row, sprite)
    screen << screen_char(sprite, cycle)
  end

  x += instruction.last.to_i

  set_sprite(x, row, sprite)
end

puts screen.scan(/.{40}/)
