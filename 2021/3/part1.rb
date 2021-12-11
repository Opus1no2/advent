# frozen_string_literal: true

input = File.read('input.txt').split("\n")

most_common = []
least_common = []

input[0].split('').each.with_index do |_, idx|
  map = [0, 0]

  input.each do |bin|
    map[bin[idx].to_i] += 1
  end

  common = map[0] > map[1] ? 0 : 1
  least = common.zero? ? 1 : 0

  most_common << common
  least_common << least
end

p most_common.join.to_i(2) * least_common.join.to_i(2)
