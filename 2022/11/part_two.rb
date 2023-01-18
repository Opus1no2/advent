# frozen_string_literal: true

require 'pp'
require 'ostruct'
require 'pry'

input = File.read('./input.txt').split("\n\n")

class Monkey
  DIMINISH_WORRY_BY = 3

  ATTRS = %i[
    id
    items
    operand
    operator
    divisor
    true_recipient
    false_recipient
    worry_level
    items_counted
  ].freeze

  attr_accessor(*ATTRS)

  def initialize
    @items_counted = 0
    @mod = 1
  end

  def call(monkeys, mod)
    until items.empty?
      item_value = items.shift

      @items_counted += 1
      new_operand = operand == 'old' ? item_value.to_i : operand.to_i

      initial_worry_level = item_value.send(operator, new_operand)
      worry_level = initial_worry_level % mod

      if (worry_level % divisor).zero?
        monkeys[true_recipient].items << worry_level
      else
        monkeys[false_recipient].items << worry_level
      end
    end
  end
end

class InputParser
  attr_accessor :input, :parts

  def initialize(input)
    @input = input
    @parts = input.split("\n").map(&:strip)
  end

  def attrs
    @attrs ||= OpenStruct.new(
      id: parts[0].split(' ').last.sub!(':', '').to_i,
      items: parts[1].split(':').last.strip.split(',').map(&:to_i),
      operand: parts[2].split(' ')[-1].strip,
      operator: parts[2].split(' ')[-2].strip,
      divisor: parts[3].split(' ').last.to_i,
      true_recipient: parts[4].split(' ').last.to_i,
      false_recipient: parts[5].split(' ').last.to_i
    )
  end
end

class Solve
  attr_accessor :input, :parser, :rounds

  def initialize(input, rounds, parser = InputParser)
    @input = input
    @parser = parser
    @rounds = rounds
  end

  def self.call(input, rounds = 20)
    new(input, rounds).call
  end

  def mod
    @mod ||= monkeys.inject(1) do |accum, monkey|
      accum *= monkey.divisor
    end
  end

  def monkeys
    @monkeys ||= input.map do |m|
      attrs = parser.new(m).attrs

      Monkey.new.tap do |monkey|
        monkey.worry_level = 0
        monkey.id = attrs.id
        monkey.items = attrs.items
        monkey.divisor = attrs.divisor
        monkey.operand = attrs.operand
        monkey.operator = attrs.operator
        monkey.true_recipient = attrs.true_recipient
        monkey.false_recipient = attrs.false_recipient
      end
    end
  end

  def call
    rounds.times do
      monkeys.each do |monkey|
        monkey.call(monkeys, mod)
      end
    end

    monkeys.map(&:items_counted).sort.last(2).reduce(:*)
  end
end

p Solve.call(input, 10_000)
