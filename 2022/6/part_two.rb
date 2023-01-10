require 'set'
input = File.read('./input.txt')

def solve(str, sidx)
  substr = str[sidx..(sidx + 13)]

  return (sidx + 14) if Set.new(substr.split('')).size == substr.length

  solve(str, sidx += 1)
end

p solve(input, 0)