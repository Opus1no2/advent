bags = File.read("./input.txt")
  .split("\n")
  .map { |s| s.split('') }

alphas = ('a'..'z').to_a + ('A'..'Z').to_a
priorities = alphas.each_with_object({}).with_index { |(n, h), i| h[n] = i + 1}

sum = 0

bags.each_slice(3) do |group|
  intersections = group[0].intersection(group[1], group[2])

  intersections.each do |char|
    sum += priorities[char]
  end
end

p sum
