raw_input = File.read("./input.txt").split("\n\n")
column_data = raw_input.first.split("\n")

# column_str = " 1   2   3"
column_str = column_data.last

# indexes of the ints contained in column_str [1, 5, 9]
column_idxs = column_str.split.map { |c| column_str.index(c) }

# column data structure - array of arrays
cols = Array.new(column_idxs.length) { Array.new }

raw_columns = column_data[0..(column_data.length - 2)]

raw_columns.each do |col|
  column_idxs.each do |idx|
    if col[idx] && col[idx].match(/^[[:alpha:]]$/)
      cols[column_str[idx].to_i - 1] << col[idx]
    end
  end
end

cols = cols.map { |c| c.reverse }

directions = raw_input.last.split("\n").map do |d|
  d.split(" ").select { |str| str.match?(/[[:digit:]]/) }.map(&:to_i)
end

directions.each do |direction|
  number = direction[0].to_i
  from = direction[1].to_i - 1
  to = direction[2].to_i - 1

  removed = cols[from].slice!((cols[from].length - number)..cols[from].length).reverse

  removed.each do |r|
    cols[to] << r
  end
end

p cols.map { |c| c.last }.join("")