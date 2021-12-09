input = File.read("input.txt").split("\n")
test_input = File.read("test_input.txt").split("\n")

def part1(input)
  h = 0
  d = 0

  input.each do |val|
    direction, units = val.split(' ')

    case direction
    when 'forward'
      h += units.to_i
    when 'down'
      d += units.to_i
    when 'up'
      d -= units.to_i
    end
  end

  p h * d
end

def part2(input)
  a = 0
  h = 0
  d = 0

  input.each do |val|
    direction, units_str = val.split(' ')
    units = units_str.to_i
    
    case direction
    when 'forward'
      h += units
      d += a * units
    when 'down'
      a += units
    when 'up'
      a -= units
    end
  end

  p h * d
end

#part1(input)
part2(input)
