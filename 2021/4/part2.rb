# frozen_string_literal: true

input = File.read('input').split("\n")

draws = input[0].split(',')

boards = input[2..input.length].chunk { |i| i.length.positive? }.each_with_object([]) do |i, r|
  r << i[1].map(&:split) if i[0]
end

board_states = boards.map do |board|
  board.map { |r| Array.new(r.length, 0) }
end

complete = []
last_draw = nil

draws.each do |draw|
  boards.each.with_index do |board, b_idx|
    board.each.with_index do |row, r_idx|
      row.each.with_index do |cell, c_idx|
        if cell == draw && !complete.include?(b_idx)
          board_states[b_idx][r_idx][c_idx] = 1

          winning_rows = board_states[b_idx].any? do |s_row|
            s_row.all?(&:odd?)
          end
          winning_cols = board_states[b_idx].transpose.any? do |s_row|
            s_row.all?(&:odd?)
          end

          if winning_rows || winning_cols
            complete << b_idx
            last_draw = draw
          end
        end
      end
    end
  end
end

sum = 0
board_states[complete.last].each.with_index do |row, r_idx|
  row.each.with_index do |cell, c_idx|
    sum += boards[complete.last][r_idx][c_idx].to_i if cell.zero?
  end
end

pp sum * last_draw.to_i
