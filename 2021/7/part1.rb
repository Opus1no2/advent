# frozen_string_literal: true

input = File.read('test_input.txt').split(',').map(&:to_i)

min = input.min
max = input.max
range = (min..max).to_a

cheapest_move = min
fuel_cost = Float::INFINITY

range.each do |target|
  moves = input.map do |position|
    (position - target).abs
  end

  sum = moves.reduce(:+)

  if sum < fuel_cost
    fuel_cost = sum
    cheapest_move = target
  end
end

pp "cheapest move: #{cheapest_move}"
pp "fuel cost: #{fuel_cost}"
