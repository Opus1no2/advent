assignments = File.read("./input.txt")
  .split("\n")

score = 0

assignments.each do |code|
  sections = code.split(',').map { |c| c.split('-') }.map { |c| (c[0]..c[1]).to_a }
  intersections = sections[0].intersection(sections[1])

  if intersections.length == sections[0].length || intersections.length == sections[1].length
    score += 1
  end
end

p score
