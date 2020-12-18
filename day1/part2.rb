require 'pry-byebug'

input = File.read("./input.txt")

def solve(input)
  input.split.permutation(3).each do |set|
    first, second, third = set.map(&:to_i)

    return first * second * third if first + second + third == 2020
  end

  "No solution"
end

puts solve(input)
