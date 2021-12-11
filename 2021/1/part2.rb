# frozen_string_literal: true

input = File.read('input.txt').split("\n")

sums = []

input.each.with_index do |_, idx|
  sums << input[idx..idx + 2].reduce(:+) if idx < input.length - 2
end

answer = sums.each.with_index.inject(0) do |memo, (val, idx)|
  memo += 1 if idx.positive? && val > input[idx - 1]
  memo
end

p answer
