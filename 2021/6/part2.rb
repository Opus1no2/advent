# frozen_string_literal: true

input = File.read('input.txt')
fish = input.split(',').map(&:to_i)

fish_map = Array.new(9, 0)

fish.each do |countdown|
  fish_map[countdown] += 1
end

def solve(fish_map, days = 80)
  return fish_map.reduce(:+) if days.zero?

  zeros = fish_map[0]

  new_map = Array.new(9, 0)

  fish_map.each.with_index do |count, day|
    new_map[day - 1] = count
  end

  new_map[6] += zeros

  solve(new_map, days -= 1)
end

p solve(fish_map, 256)

