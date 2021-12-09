require 'matrix'

test_input = File.read('test_input').split("\n")
input = File.read('input').split("\n")

def winning_board?(coords, board_idx)
  rows = coords[board_idx].any? { |row| row.all? { |cell| cell == 1 } }
  cols = coords[board_idx].map.with_index do |row, idx|
    row.map.with_index do |_, cdx|
      coords[board_idx][cdx][idx]
    end
  end

  rows || cols.any? { |col| col.all? { |c| c == 1 } }
end

def create_boards(input)
  input[1..input.length].chunk { |n| n.length.positive? }.inject([]) do |accum, ray|
    accum << ray[1].map(&:split) if ray.first
    accum
  end
end

def create_draws(input)
  input.first.split(',')
end

def create_coords(boards)
  boards.map do |board|
    board.map { |r| Array.new(r.length, 0) }
  end
end

answer = 0
boards = create_boards(test_input)
coords = create_coords(boards)
draws = create_draws(test_input)
board_hits = Array.new(boards.length, [])

last = 0
last_winning_draw = 0
sum = 0

draws.each do |draw|
  boards.each.with_index do |board, b_idx|
    board.each.with_index do |row, r_idx|
      row.each.with_index do |cell, c_idx|
        coords[b_idx][r_idx][c_idx] = 1 if cell == draw
      end

      if winning_board?(coords, b_idx)
        last = b_idx
        last_winning_draw = draw
      end
    end
  end
end

coords[last].each.with_index do |w_row, wr_idx|
  w_row.each.with_index do |w_cell, wc_idx|
    sum += boards[last][wr_idx][wc_idx].to_i if w_cell.zero?
  end
end

answer = sum * last_winning_draw.to_i

