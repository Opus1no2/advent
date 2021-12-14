# frozen_string_literal: true

input = File.read('input.txt').split("\n")

outputs = input.map { |i| i.split(' | ') }.map(&:last).map { |i| i.split(' ') }.flatten

count = outputs.reduce(0) do |sum, o|
  sum += 1 if [2, 4, 3, 7].include?(o.length.to_i)
  sum
end

pp count
