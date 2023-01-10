input = File.read("./input.txt").split("\n\n")
p input.map { |chunk| chunk.split("\n").map(&:to_i).reduce(:+) }.max