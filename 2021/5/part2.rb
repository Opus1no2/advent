# frozen_string_literal: true

input = File.read('input.txt').split("\n")

max_x = -1
max_y = -1
xy = []

input.each do |str|
  coords = str.split(' -> ').map { |i| i.split(',') }

  x1, x2 = coords.map(&:first).map(&:to_i)
  y1, y2 = coords.map(&:last).map(&:to_i)

  mx = [x1, x2].max
  my = [y1, y2].max

  max_x = mx > max_x ? mx : max_x
  max_y = my > max_y ? my : max_y

  xy << { x1: x1, x2: x2, y1: y1, y2: y2 }
end

grid = Array.new(max_y + 1) { Array.new(max_x + 1, 0) }

xy.each do |coords|
  x1 = coords[:x1]
  x2 = coords[:x2]
  y1 = coords[:y1]
  y2 = coords[:y2]

  x_range = x1 < x2 ? (x1..x2).to_a : (x2..x1).to_a.reverse
  y_range = y1 < y2 ? (y1..y2).to_a : (y2..y1).to_a.reverse

  if y1 == y2
    x_range.each do |val|
      grid[y1][val] += 1
    end
  elsif x1 == x2
    y_range.each do |val|
      grid[val][x1] += 1
    end
  else
    x_range.zip(y_range).each do |coord|
      grid[coord[1]][coord[0]] += 1
    end
  end
end

answer = grid.flatten.inject(0) do |sum, val|
  sum += 1 if val > 1
  sum
end

pp answer
