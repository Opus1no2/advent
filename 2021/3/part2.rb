# frozen_string_literal: true

input = File.read('input.txt').split("\n")

def calc_oxy(input, idx = 0)
  return input if input.length == 1

  ox_col_sum = input.map { |bin| bin[idx].to_i }.reduce(:+)
  ox_common = ox_col_sum.to_f >= (input.length.to_f / 2.0) ? 1 : 0
  reduced = input.select { |bin| bin[idx].to_i == ox_common }
  calc_oxy(reduced, idx += 1)
end

def calc_co2(input, idx = 0)
  return input if input.length == 1

  co_map = [0, 0]
  input.each { |bin| co_map[bin[idx].to_i] += 1 }
  reduced = input.select { |bin| bin[idx].to_i == co_map.each_with_index.min.last }
  calc_co2(reduced, idx += 1)
end

p calc_co2(input).first.to_i(2) * calc_oxy(input).first.to_i(2)
