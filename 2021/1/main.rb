input = File.read("input.txt").split("\n").map(&:to_i)
test_input = File.read("test_input.txt").split("\n").map(&:to_i)

def part1(input)
  input.each.with_index.inject(0) do |memo, (val, idx)|
    memo += 1 if idx > 0 && val > input[idx - 1]
    memo
  end
end

def part2(input)
  sums = []
  increase = 0

  input.each.with_index do |val, idx|
    sums << input[idx..idx + 2].reduce(:+) if idx < input.length - 2
  end

  p part1(sums)
end

part2(input)
