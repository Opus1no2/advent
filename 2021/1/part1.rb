# frozen_string_literal: true

input = File.read('input.txt').split("\n")

answer = input.each.with_index.inject(0) do |memo, (val, idx)|
  memo += 1 if idx.positive? && val > input[idx - 1]
  memo
end

p answer
