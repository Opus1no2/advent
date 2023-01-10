guide = File.read("./input.txt").split("\n")

opponent_map = {
  "A" => 1, # rock
  "B" => 2, # paper
  "C" => 3 # scissors
}

my_map = {
  "X" => 1, # rock
  "Y" => 2, # paper
  "Z" => 3 # scissors
}

map = {
  "A" => "Z",
  "B" => "X",
  "C" => "Y",
  "X" => "C",
  "Y" => "A",
  "Z" => "B"
}

score = 0

guide.each do |hand|
  opponent, mine = hand.split(" ")

  if map[mine] == opponent
    score += 6 + my_map[mine]
  elsif map[opponent] == mine
    score += 0 + my_map[mine]
  elsif my_map[mine] == opponent_map[opponent]
    score += 3 + my_map[mine]
  end
end

p score
