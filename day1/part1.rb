require 'pry-byebug'

input = File.readlines("./input.txt", chomp: true)

def solve(input)
  0.upto(input.size) do |r|
    0.upto(input.size) do |c|
      first, second = [input[r], input[c]].map(&:to_i)

      return first * second if first + second == 2020
    end
  end

  "No solution"
end

puts solve(input)
