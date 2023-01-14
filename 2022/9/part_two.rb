# frozen_string_literal: true

require 'pp'
require 'pry'
require 'set'

directions = File.read('./input.txt').split("\n")

coords = Set.new
coords.add([0, 0])

knots = 10.times.map { Hash[[['x', 0], ['y', 0]]] }

directions.each do |dir|
  steps = dir.split(' ').last.to_i

  if %w[R L].include?(dir[0])
    coord, step = dir[0] == 'R' ? ['x', 1] : ['x', -1]
  end

  if %w[U D].include?(dir[0])
    coord, step = dir[0] == 'U' ? ['y', 1] : ['y', -1]
  end

  steps.times do
    knots[0][coord] += step

    (1..(knots.length - 1)).to_a.each do |v|
      prev = knots[v - 1]

      next unless (prev['x'] - knots[v]['x']).abs > 1 || (prev['y'] - knots[v]['y']).abs > 1

      if knots[v]['x'] < prev['x']
        knots[v]['x'] += 1
      elsif knots[v]['x'] > prev['x']
        knots[v]['x'] -= 1
      end

      if knots[v]['y'] < prev['y']
        knots[v]['y'] += 1
      elsif knots[v]['y'] > prev['y']
        knots[v]['y'] -= 1
      end

      coords.add([knots[v]['x'], knots[v]['y']]) if v == knots.length - 1
    end
  end
end

# correct: 2627
p coords.size
