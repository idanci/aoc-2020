require 'pry-byebug'

input = File.read("./input.txt")

def solve(input)
  input.split.permutation(2).each do |pair|
    first, second = pair.map(&:to_i)

    return first * second if first + second == 2020
  end

  "No solution"
end

puts solve(input)
