require 'pry-byebug'

input = File.readlines("./input.txt", chomp: true)

def solve(input)
  0.upto(input.size) do |x|
    0.upto(input.size) do |y|
      0.upto(input.size) do |z|
        first, second, third = [input[x], input[y], input[z]].map(&:to_i)

        return first * second * third if first + second + third == 2020
      end
    end
  end

  "No solution"
end

puts solve(input)
