require 'pry-byebug'

# byr (Birth Year) - four digits; at least 1920 and at most 2002.
# iyr (Issue Year) - four digits; at least 2010 and at most 2020.
# eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
# hgt (Height) - a number followed by either cm or in:
  # If cm, the number must be at least 150 and at most 193.
  # If in, the number must be at least 59 and at most 76.
# hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
# ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
# pid (Passport ID) - a nine-digit number, including leading zeroes.
# cid (Country ID) - ignored, missing or not.

VALIDATION_RULES = {
  "byr" => ->(val) { val.to_i.between?(1920, 2002) },
  "iyr" => ->(val) { val.to_i.between?(2010, 2020) },
  "eyr" => ->(val) { val.to_i.between?(2020, 2030) },
  "hcl" => ->(val) { val.match?(/#[a-f0-9]{6}/) },
  "ecl" => ->(val) { %w(amb blu brn gry grn hzl oth).include?(val) },
  "pid" => ->(val) { val.match?(/^\d{9}$/) },
  "hgt" => ->(val) do
    match_data = val.match(/^(?<hg>\d{2,3})(?<unit>(cm|in))$/)
    match_data && (
      match_data[:unit] == "cm" && match_data[:hg].to_i.between?(150, 193) ||
      match_data[:unit] == "in" && match_data[:hg].to_i.between?(59, 76)
    )
  end
}

def valid_passport?(data)
  VALIDATION_RULES.all? do |field, rule|
    match_data = data.match(/#{field}:(?<val>\S+)/)
    match_data && rule.call(match_data[:val])
  end
end

def solve(input)
  input.slice_after { |el| el.empty? }.map { |rows| rows.join(" ").strip }.map do |data|
    valid_passport?(data) ? 1 : 0
  end.inject(:+)
end

input = File.readlines('./input.txt', chomp: true)

puts solve(input)
