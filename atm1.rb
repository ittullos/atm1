require 'io/console'
require 'csv'

def balance(amount)
  puts "\nYour account balance is: $" + amount.to_s
  print "\n"
end

def withdraw(amount)
  print "\nEnter the amount you wish to withdraw: "
  num = gets.to_f
  if num > amount
    puts "\nInsufficient Funds"
    print "\n"
    return
  else
    num2 = amount - num
    bal = num2.round(2)
    puts "\nDispensing Cash..."
    print "\n"

    if num >= 100
      hund = num.floor / 100
      rem = num % 100
      rem.round(2)
    else
      hund = 0
      rem = num
    end

    if rem >= 50
      fif = rem.floor / 50
      rem2 = rem % 50
    else
      fif = 0
      rem2 = rem
    end

    if rem2 >= 20
      twen = rem2.floor / 20
      rem = rem2 % 20
    else
      twen = 0
      rem = rem2
    end

    if rem >= 10
      ten = rem.floor / 10
      rem2 = rem % 10
    else
      ten = 0
      rem2 = rem
    end

    if rem2 >= 5
      five = rem2.floor / 5
      rem = rem2 % 5
    else
      five = 0
      rem = rem2
    end

    if rem >= 1
      one = rem.floor / 1
      rem2 = rem % 1
    else
      one = 0
      rem2 = rem
    end

    coin = rem2.round(2)
    coin2 = coin * 100

    if coin2 >= 25
      quar = coin2.floor / 25
      rem = coin2 % 25
    else
      quar = 0
      rem = coin2
    end

    if rem >= 10
      dime = rem.floor / 10
      rem2 = rem % 10
    else
      dime = 0
      rem2 = rem
    end

    if rem2 >= 5
      nick = rem2.floor / 5
      rem = rem2 % 5
    else
      nick = 0
      rem = rem2
    end

    pen = rem.floor

    if hund > 0
      if hund > 1
        puts hund.to_s + " hundreds"
      else
        puts hund.to_s + " hundred"
      end
    end

    if fif > 0
      if fif > 1
        puts fif.to_s + " fifties"
      else
        puts fif.to_s + " fifty"
      end
    end

    if twen > 0
      if twen > 1
        puts twen.to_s + " twenties"
      else
        puts twen.to_s + " twenty"
      end
    end

    if ten > 0
      if ten > 1
        puts ten.to_s + " tens"
      else
        puts ten.to_s + " ten"
      end
    end

    if five > 0
      if five > 1
        puts five.to_s + " fives"
      else
        puts five.to_s + " five"
      end
    end

    if one > 0
      if one > 1
        puts one.to_s + " ones"
      else
        puts one.to_s + " one"
      end
    end

    if quar > 0
      if quar > 1
        puts quar.to_s + " quarters"
      else
        puts quar.to_s + " quarter"
      end
    end

    if dime > 0
      if dime > 1
        puts dime.to_s + " dimes"
      else
        puts dime.to_s + " dime"
      end
    end

    if nick > 0
      if nick > 1
        puts nick.to_s + " nickels"
      else
        puts nick.to_s + " nickel"
      end
    end

    if pen > 0
      if pen > 1
        puts pen.to_s + " pennies"
      else
        puts pen.to_s + " penny"
      end
    end

    puts "\nRemaining Balance: $" + bal.to_s
    print "\n"

    return bal
  end
end

def deposit(amount)
  print "\nPlease insert cash: $"
  dep = gets.to_f
  bal = dep + amount
  cash = bal.floor
  rem = (bal % cash) * 100
  coin = rem.ceil
  puts "\nNew account balance: $" + cash.to_s + "." + coin.to_s
  print "\n"
  return bal
end

def csv_parser file_path
  lines = File.read(file_path).split("\n").map do |line|
    line.split(',')
  end
end

def writebal(array)
  CSV.open("bank1.dat", "w") do |csv|
    csv << [array[0][0], array[0][1], array[0][2], array[0][3]]
    csv << [array[1][0], array[1][1], array[1][2], array[1][3]]
    csv << [array[2][0], array[2][1], array[2][2], array[2][3]]
    csv << [array[3][0], array[3][1], array[3][2], array[3][3]]
    csv << [array[4][0], array[4][1], array[4][2], array[4][3]]
  end
end





puts "\nWelcome to Bank of America"
print "\nSwipe your debit card to begin: "

card = gets.chomp
cfile = File.open(card, "r")

  cnum = cfile.read

cfile.close

data = csv_parser('bank1.dat')


#  =>here for debugging
#puts data.inspect

i = 0

while i < 5
  dnum = data[i][0]
  if dnum.to_i == cnum.to_i
    name = data[i][1]
    pin = data[i][2]
    bal = data[i][3]
    id = i
  end
  i += 1
end

print "\nPlease enter your PIN number: "

pinq = STDIN.noecho(&:gets).chomp

if pinq.to_i != pin.to_i
  puts "\nIncorrect PIN, Please try again"
else
  puts "\nHello, " + name.to_s
  puts "\nPlease select from the menu below: "
  puts "\n1 - Check your balance"
  puts "\n2 - Make a withdrawal"
  puts "\n3 - Make a deposit"
  puts "\n4 - Exit"
  print "\n  =>"

  input = gets.chomp

  if input.to_i == 1
    balance(bal.to_f)
  elsif input.to_i == 2
    data[id][3] = withdraw(bal.to_f)
    writebal(data)
  elsif input.to_i == 3
    data[id][3] = deposit(bal.to_f)
    writebal(data)
  elsif input.to_i == 4
    puts "\nThanks for using Bank of America ATM"
    puts "\nHave a great day!!"
  else
    puts "\nInvalid entry - Please try again"
  end
end

#puts data [i][0]

#while i < 5
#  if data[0][i]

#file = File.open("bank1.dat", "r+")

#puts "cnum = " + cnum

#  for line in file.readlines
#    if line.include?(cnum)
#      puts "YES!!"
#    end
#  end

#file.close




#name = gets.chomp
#file = File.open("bank1.dat", )
#print "Please enter your PIN number: "
#pin = STDIN.noecho(&:gets).chomp
#puts "\nYour name: " + name
#print "Your PIN: "
#puts pin
