card_number = "342804633855673"
valid = false
doubled = []
summed_digits = []

individual_numbers = card_number.split("").reverse!

# from the rightmost digit, which is the check digit, moving left, double the
#value of every second digit
individual_numbers.each_with_index do |num, i|
  num = num.to_i
  if i % 2 == 1
    num *= 2
  end
  doubled.push(num)
end

# if product of this doubling operation is greater than 9 (e.g., 7 * 2 = 14),
#then sum the digits of the products (e.g., 10: 1 + 0 = 1, 14: 1 + 4 = 5).
doubled.each do |num|
  if num > 9
    new_num = ((num / 10) + (num % 10))
  else
    new_num = num
  end
  summed_digits.push(new_num)
end

# take the sum of all the digits
final = summed_digits.inject(:+)

# if and only if the total modulo 10 is equal to 0 then the number is valid
if final % 10 == 0
  valid = true
end

# Output
## If it is valid, print "The number is valid!"
## If it is invalid, print "The number is invalid!"
if valid
  puts "The number is valid!"
else
  puts "The number is invalid!"
end
