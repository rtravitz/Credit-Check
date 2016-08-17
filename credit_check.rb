CARD_NUMBERS = %w[  5541808923795240
                    4024007136512380
                    6011797668867828
                    5541801923795240
                    4024007106512380
                    6011797668868728
                    342804633855673
                    342801633855673 ]

CARD_NUMBERS.each do |card_number|

  valid = false

  # from the rightmost digit, which is the check digit, moving left, double the
  #value of every second digit
  reversed_numbers = card_number.split("").reverse!
  doubled = []
  reversed_numbers.each_with_index do |num, idx|
    num = num.to_i
    num *= 2 if idx.odd?
    doubled.push(num)
  end

  # if product of this doubling operation is greater than 9 (e.g., 7 * 2 = 14),
  #then sum the digits of the products (e.g., 10: 1 + 0 = 1, 14: 1 + 4 = 5).
  summed_digits = doubled.map do |num|
    if num > 9
      new_num = ((num / 10) + (num % 10))
    else
      num
    end
  end

  # take the sum of all the digits
  final = summed_digits.inject(:+)

  # if and only if the total modulo 10 is equal to 0 then the number is valid
  valid = true if final % 10 == 0

  # Output
  #Identify card type for prettier output!

  if reversed_numbers.length == 15
    card_type = "American Express"
  else
    card_type = "credit card"
  end

  ## If it is valid, print "The number is valid!"
  ## If it is invalid, print "The number is invalid!"
  if valid
    puts "The #{card_type} is valid!"
  else
    puts "The #{card_type} is invalid!"
  end
end
