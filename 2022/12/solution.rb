# frozen_string_literal: true

# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/AbcSize
require 'pry'

input = File.read('./input.txt')

hash = ('a'..'z').to_a
                 .each_with_object({})
                 .with_index { |(val, map), i| map[val] = i }
                 .merge('S' => -1, 'E' => 26)

grid = input.split("\n")
            .map { |r| r.split('').map { |c| hash[c] } }

start = []
destination = []

grid.each.with_index do |row, y|
  row.each.with_index do |cell, x|
    start = [y, x] if cell == -1
    destination = [y, x] if cell == 26
  end
end

frontier = []
frontier << start

came_from = {}
came_from[start] = nil

def neighbors(current, grid)
  n = []
  y, x = current

  # up
  n << [y - 1, x] if y.positive? && (grid[y - 1][x] - grid[y][x] <= 1)

  # left
  n << [y, x - 1] if x.positive? && (grid[y][x - 1] - grid[y][x] <= 1)

  # down
  n << [y + 1, x] if y < (grid.length - 1) && (grid[y + 1][x] - grid[y][x] <= 1)

  # right
  n << [y, x + 1] if x < (grid[0].length - 1) && (grid[y][x + 1] - grid[y][x] <= 1)
  n
end

while frontier.length.positive?
  current = frontier.shift

  neighbors = neighbors(current, grid)

  neighbors.each do |neighbor|
    unless came_from.include?(neighbor)
      frontier << neighbor
      came_from[neighbor] = current
    end
  end
end

current = destination
path = []

while current != start
  path << current
  current = came_from[current]
end

path << start

pp path.length - 1

# 506 to high

# rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
