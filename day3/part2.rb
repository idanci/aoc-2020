require 'pry-byebug'

def solve(input, x_offset, y_offset)
  x, y, trees_count = 0, 0, 0

  input.size.times do |index|
    return trees_count if index == input.size - y_offset || input.size < y

    x += x_offset
    y += y_offset

    return trees_count if input.size < y

    input[y] *= 2 until input[y].size > x

    trees_count += 1 if input[y][x] == '#'
  end
end

input = File.readlines('./input.txt', chomp: true)

puts [
  solve(input, 1, 1),
  solve(input, 3, 1),
  solve(input, 5, 1),
  solve(input, 7, 1),
  solve(input, 1, 2)
].inject(:*)
