# frozen_string_literal: true

require 'pp'
require 'pry'

tree_grid = File.read('./input.txt').split("\n")
                .map { |row| row.split('').map(&:to_i) }

max_scenic_score = -1

tree_grid.each.with_index do |row, i|
  next if i.zero? || i == tree_grid.length - 1

  row.each.with_index do |cell, j|
    next if j.zero? || j == row.length - 1

    top = (0..(i - 1)).to_a.reverse
    left = (0..(j - 1)).to_a.reverse
    bottom = ((i + 1)..(tree_grid.length - 1)).to_a
    right = ((j + 1)..(row.length - 1)).to_a

    top_bottom = [top, bottom].map do |path|
      path.reduce(0) do |sum, v|
        (break sum + 1) if tree_grid[v][j] >= cell
        sum + 1 if tree_grid[v][j] < cell
      end
    end

    left_right = [left, right].map do |path|
      path.reduce(0) do |sum, v|
        (break sum + 1) if tree_grid[i][v] >= cell
        sum + 1 if tree_grid[i][v] < cell
      end
    end

    score = (top_bottom + left_right).reduce(:*)

    max_scenic_score = score > max_scenic_score ? score : max_scenic_score
  end
end

p max_scenic_score
