# frozen_string_literal: true

require 'pp'

tree_grid = File.read('./input.txt').split("\n")
                .map { |row| row.split('') }
                .map { |row| row.map(&:to_i) }

perimiter_count = tree_grid.first.length + tree_grid.last.length + ((tree_grid.length - 2) * 2)

inner_grid_count = 0

tree_grid.each.with_index do |row, i|
  next if i.zero? || i == tree_grid.length - 1

  row.each.with_index do |cell, j|
    next if j.zero? || j == row.length - 1

    top_visible = (0..(i - 1)).to_a.all? { |v| tree_grid[v][j] < cell }

    if top_visible
      inner_grid_count += 1
      next
    end

    left_visible = (0..(j - 1)).to_a.all? { |v| tree_grid[i][v] < cell }

    if left_visible
      inner_grid_count += 1
      next
    end

    bottom_visible = ((i + 1)..(tree_grid.length - 1)).to_a.all? { |v| tree_grid[v][j] < cell }

    if bottom_visible
      inner_grid_count += 1
      next
    end

    right_visible = ((j + 1)..(row.length - 1)).to_a.all? { |v| tree_grid[i][v] < cell }

    if right_visible
      inner_grid_count += 1
      next
    end
  end
end

pp inner_grid_count + perimiter_count
