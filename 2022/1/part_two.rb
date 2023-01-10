input = File.read("./sample.txt").split("\n\n")
sums = input.map { |chunk| chunk.split("\n").map(&:to_i).reduce(:+) }.sort
p sums[(sums.length - 3)..sums.length].reduce(:+)
