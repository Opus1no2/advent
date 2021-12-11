# frozen_string_literal: true

input = File.read('input.txt').split("\n")

max_x = -1
max_y = -1
xy = []

input.each do |str|
  coords = str.split(' -> ').map { |i| i.split(',') }

  x1, x2 = coords.map(&:first).map(&:to_i).sort
  y1, y2 = coords.map(&:last).map(&:to_i).sort

  mx = [x1, x2].max
  my = [y1, y2].max

  max_x = mx > max_x ? mx : max_x
  max_y = my > max_y ? my : max_y

  xy << { x1: x1, x2: x2, y1: y1, y2: y2 } if x1 == x2 || y1 == y2
end

grid = Array.new(max_y + 1) { Array.new(max_x + 1, 0) }

xy.each do |coords|
  if coords[:y1] == coords[:y2]
    indexes = (coords[:x1]..coords[:x2]).to_a
    indexes.each do |idx|
      grid[coords[:y1]][idx] += 1
    end
  end

  next unless coords[:x1] == coords[:x2]

  indexes = (coords[:y1]..coords[:y2]).to_a
  indexes.each do |idx|
    grid[idx][coords[:x1]] += 1
  end
end

answer = grid.flatten.inject(0) do |sum, val|
  sum += 1 if val > 1
  sum
end

p answer
