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

win_map = {
  "A" => "Z",
  "B" => "X",
  "C" => "Y",
  "X" => "C",
  "Y" => "A",
  "Z" => "B"
}

lose_map = win_map.each_with_object({}) {|(k, v), h| h[v] = k }

score = 0
guide.each do |hand|
  opponent, mine = hand.split(" ")

  if mine == "X"
    score += my_map[win_map[opponent]]
  elsif mine == "Y"
    score += 3 + opponent_map[opponent]
  elsif mine == "Z"
    score += 6 + my_map[lose_map[opponent]]
  end
end

p score
