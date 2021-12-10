test_input = File.read('test_input').split("\n")
input = File.read('input').split("\n")

draws = input[0].split(',')

boards =  input[2..input.length].chunk{ |i| i.length > 0 }.inject([]) do |r, i|
  r << i[1].map(&:split) if i[0]
  r
end

board_states = boards.map do |board|
  board.map { |r| Array.new(r.length, 0) }
end

complete = []

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
            sum = 0
            board_states[b_idx].each.with_index do |s_row, s_idx|
              s_row.each.with_index do |s_cell, c_idx|
                sum += board[s_idx][c_idx].to_i if s_cell == 0
              end
            end

            pp sum * draw.to_i
            return
          end
        end
      end
    end
  end
end
