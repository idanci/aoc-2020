require 'pry-byebug'

REQUIRED_FIELDS = %w(byr iyr eyr hgt hcl ecl pid)

def valid_passport?(data)
  REQUIRED_FIELDS.all? { |field| data.include?("#{field}:") }
end

def solve(input)
  input.slice_after { |el| el.empty? }.map { |rows| rows.join(" ").strip }.map do |data|
    valid_passport?(data) ? 1 : 0
  end.inject(:+)
end

input = File.readlines('./input.txt', chomp: true)

puts solve(input)
