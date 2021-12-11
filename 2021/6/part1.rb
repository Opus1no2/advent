# frozen_string_literal: true

input = File.read('input.txt')
fish = input.split(',').map(&:to_i)

def solve(fish, days = 80)
  return fish.length if days.zero?

  clone = fish.clone
  fish.each.with_index do |countdown, idx|
    if countdown.zero?
      clone[idx] = 6
      clone << 8
    else
      clone[idx] = countdown - 1
    end
  end

  solve(clone, days -= 1)
end

p solve(fish, 80)
