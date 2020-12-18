require 'pry-byebug'

def solve(input, x_offset, y_offset)
  x, y, trees_count = 0, 0, 0

  input.size.times do |index|
    return trees_count if index == input.size - y_offset

    x += x_offset

    input[index + y_offset] *= 2 until input[index + y_offset].size > x

    trees_count += 1 if input[index + y_offset][x] == '#'
  end
end

input = File.readlines('./input.txt', chomp: true)

puts solve(input, 3, 1)
