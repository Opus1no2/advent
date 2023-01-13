# frozen_string_literal: true

require 'pp'
require 'pry'
require 'set'

directions = File.read('./input.txt').split("\n")

h = { x: 0, y: 0 }
t = { x: 0, y: 0 }

coords = Set.new

direction = {
  'R' => 1,
  'L' => -1,
  'U' => 1,
  'D' => -1
}

directions.each do |dir|
  steps = dir.split(' ').last.to_i

  if %w[L R].include?(dir[0])
    steps.times do
      prev_x = h[:x]
      h[:x] += direction[dir[0]]

      next unless (h[:x] - t[:x]).abs >= 2

      t[:y] = h[:y] if (t[:y] - h[:y]).abs.positive?
      t[:x] = prev_x
      coords.add([t[:x], t[:y]])
    end
  end

  next unless %w[U D].include?(dir[0])

  steps.times do
    prev_y = h[:y]
    h[:y] += direction[dir[0]]

    next unless (h[:y] - t[:y]).abs >= 2

    t[:x] = h[:x] if (t[:x] - h[:x]).abs.positive?
    t[:y] = prev_y
    coords.add([t[:x], t[:y]])
  end
end

# correct: 6357
p coords.size
