# frozen_string_literal: true

require 'pry'

inputs = File.read('./input.txt').split("\n")

inputs = inputs.select do |line|
  parts = line.split(' ')
  parts[1] != 'ls' && parts[0] != 'dir'
end

def dir_map(current_dir, map, idx, inputs)
  return map if idx >= inputs.length

  parts = inputs[idx].split(' ')

  if parts[0] == '$' && parts[1] == 'cd'
    if parts.last == '..'
      dirs = current_dir.split('|')
      dirs.pop
      current_dir = dirs.join('|')
    else
      current_dir += parts.last == '/' ? '/' : "|#{parts.last}"
    end

    return dir_map(current_dir, map, idx += 1, inputs)
  end

  inputs[idx..(inputs.length - 1)].each.with_index do |line, i|
    parts = line.split(' ')

    return dir_map(current_dir, map, idx += i, inputs) if parts[0] == '$'

    map[current_dir] = [] unless map[current_dir]
    map[current_dir] << parts[0].to_i

    return dir_map(current_dir, map, idx += (i + 1), inputs)
  end
end

def chunk_dirs(dir_str, ray = [])
  return ray if dir_str == ''

  ray << dir_str
  dirs = dir_str.split('|')
  dirs.pop
  chunk_dirs(dirs.join('|'), ray)
end

def solve(dir_map)
  total_map = {}

  dir_map.each do |dir_str, values|
    dir_ray = chunk_dirs(dir_str)
    sum = values.reduce(:+)

    dir_ray.each do |dir|
      total_map[dir] = 0 unless total_map[dir]
      total_map[dir] += sum
    end
  end

  unused_space = 70_000_000 - total_map['/']
  space_needed = 30_000_000 - unused_space

  total_map.select { |_, val| val >= space_needed }
           .min_by { |_k, v| v }.last
end

directory_map = dir_map('', {}, 0, inputs)
p solve(directory_map)
