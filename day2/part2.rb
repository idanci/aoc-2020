require 'pry-byebug'

def password_valid?(line)
  match_data = line.match(/^(?<min>\d+)\-(?<max>\d+)\s+(?<char>\D):\s+(?<password>.+)/)

  [match_data[:min].to_i, match_data[:max].to_i].map do |position|
    match_data[:password][position - 1] == match_data[:char] ? 1 : 0
  end.sum == 1
end

def solve
  valid_passwords = 0

  File.open("input.txt") do |f|
    f.each_line.lazy.each do |line|
      valid_passwords += 1 if password_valid?(line.chomp)
    end
  end

  valid_passwords
end

puts solve
