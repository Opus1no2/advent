# frozen_string_literal: true

require 'pry'
require 'pp'
require 'set'

instructions = File.read('./input.txt').split("\n").map { |i| i.split(' ') }

x = 1
cycle = 0
signal_str = 0

interval = 40
interval_start = 20
intervals = [interval_start]

instructions.each do |instruction|
  if instruction.first == 'noop'
    cycle += 1

    signal_str += x * cycle if cycle == interval_start

    if cycle - intervals.last == interval
      signal_str += x * cycle
      intervals << cycle
    end

    next
  end

  2.times do
    cycle += 1

    signal_str += x * cycle if cycle == interval_start

    if cycle - intervals.last == interval
      signal_str += x * cycle
      intervals << cycle
    end
  end

  x += instruction.last.to_i
end

pp signal_str
