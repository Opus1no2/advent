items = File.read("./input.txt").split("\n")

alphas = ('a'..'z').to_a + ('A'..'Z').to_a
priorities = alphas.each_with_object({}).with_index { |(n, h), i| h[n] = i + 1}

sum = 0

items.each do |item|
  first_compartment = item[0..(item.length / 2) - 1]
  second_compartment = item[(item.length / 2)..item.length]

  common = first_compartment.split('').intersection(second_compartment.split(''))

  common.each do |char|
    sum += priorities[char]
  end
end

p sum
