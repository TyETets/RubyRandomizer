require './A1_Classes.rb'

total_tests = 0
passed = 0
failed = 0

## Test 1 ##
total_tests += 1
player1 = Player.new("Gandalf")
die1 = Die.new(6, :"blue")
player1.store(die1)
player1.load()
player1.throw()
player1.replace()

puts "TEST 1:"
puts "Purpose: test storage capabilities of player/randomizer containers"
puts "Expected output: 1"
puts "Test output: #{player1.tally.last}"

#get tally of the first result to make sure correct amount of randomizers
if player1.tally.last == 1 
  puts "Test 1 passed"
  passed += 1
else
  puts "Test 1 failed"
  failed += 1
end

die2 = Die.new(10, :"red")
player1.store(die2)
player1.clear()
player1.load(colour: :"red")
player1.throw()

## Test 2 ##
total_tests += 1
puts "\n\nTEST 2:"
puts "Purpose: test the randomize functions and storage of results"
puts "Expected output: #{die2.result()}"
puts "Test output: #{player1.results().last}"

if player1.results().last == die2.result()
  puts "Test 2 passed"
  passed += 1
else
  puts "Test 2 failed"
  failed += 1
end

## Test 3 ##
total_tests += 1
player1.empty()
player1.clear()
f_bag = Bag.new()
f_bag.store(Die.new(12, :"green"))
f_bag.store(Die.new(6, :"white"))
f_bag.store(Coin.new(0.25))
expected = f_bag.count
player1.move_all(f_bag)
player1.load()
player1.throw()

puts "\n\nTEST 3:"
puts "Purpose: test capabilities of moving multiple objects using randomizer containers (use case 3)"
puts "Expected output: #{expected}"
puts "Test output: #{player1.tally.last}"
if player1.tally.last == expected
  puts "Test 3 passed"
  passed += 1
else
  puts "Test 3 failed"
  failed += 1
end

## Test 4 ##
total_tests += 1
die1.reset()
die1.roll()
die1.randomize()
die1.roll()
die1.randomize()
expected = 4

puts "\n\nTEST 4:"
puts "Purpose: test capabilities of tracking ranomizations made on a single randomizer"
puts "Expected output: #{expected}"
puts "Test output: #{die1.calls()}"
if die1.calls() == expected
  puts "Test 4 passed"
  passed += 1
else
  puts "Test 4 failed"
  failed += 1
end
die1.reset()

## Test 5 ##
total_tests += 1
die1.roll() 
puts "\n\nTEST 5:"
puts "Purpose: Test die specific methods"
puts "Expected output: colour: blue, sides: 6, sideup: (1-6)"
puts "Test output:     colour: #{die1.colour}, sides: #{die1.sides}, sideup: #{die1.sideup}"
if die1.colour == :"blue" && die1.sides == 6 && die1.sideup() <= die1.sides()
  puts "Test 5 passed"
  passed += 1
else
  puts "Test 5 failed"
  failed += 1
end

## Test 6 ##
total_tests += 1
denomination = 0.10
coin2 = Coin.new(denomination)
coin2.flip

puts "\n\nTEST 6:"
puts "Purpose: Test coin specific methods"
puts "Expected output: denomination: #{denomination}, (H or T)"
puts "Test output:     denomination: #{coin2.denomination}, #{coin2.sideup()}"
if coin2.denomination() == denomination && (coin2.sideup == :H || coin2.sideup == :T)
  puts "Test 6 passed"
  passed += 1
else
  puts "Test 6 failed"
  failed += 1
end

## Test 7 ##
total_tests += 1
a1 = Array.new
a1.push(Die.new(4, :"blue"))
a1.push(Die.new(5, :"green"))
a1.push(Coin.new(0.05))
hand = Hand.new
hand.store(Die.new(16, ":yellow"))
hand.store(Coin.new(2))
hand.next()
h_count = hand.count
bag1 = Bag.new()
bag1.store_all(a1)
bag1.move_all(hand)

puts "\n\nTEST 7:"
puts "Purpose: test randomizer container store_all and move_all functions"
puts "Expected output: bag count = #{h_count + a1.count}"
puts "Test output: bag count = #{bag1.count()}"
if bag1.count == h_count + a1.count
  puts "Test 7 passed"
  passed += 1
else
  puts "Test 7 failed"
  failed += 1
end

## Test 8 ##
total_tests += 1
player1.empty()
player1.clear()
player1.store(Coin.new(0.05))
player1.store(Die.new(12, :"yellow"))
player1.store(Die.new(8, :"black"))
player1.store(Die.new(6, :"red"))
player1.store(Die.new(20, :"blue"))
player1.store(Die.new(6, :"red"))
player1.load()
before = 6
after = 4
player1.throw()
player1.replace(item: :die, colour: :"red", sides: 6)
player1.throw()

puts "\n\nTEST 8:"
puts "Purpose: remove all red six-sided dice from their cup and place them back in the users bag (use case 4)"
puts "Expected output: amount of items in cup: before = #{before}, after = #{after}"
puts "Test output: amount of items in cup: before = #{player1.tally().last}, after = #{player1.tally().first}"
if player1.tally().last == before && player1.tally.first == after
  puts "Test 8 passed"
  passed += 1
else
  puts "Test 8 failed"
  failed += 1
end

## Test 9 ##
total_tests += 1
bag2 = Bag.new
bag2.store("TEST")
bag2.store(Coin.new(1))
bag2.store(Die.new(20, :"red"))
bag2.store(nil)
bag_before_empty = bag2.count
hand2 = bag2.empty
bag_after_empty = bag2.count
hand_before_empty = hand2.count
hand2.empty
hand_after_empty = hand2.count

puts "\n\nTEST 9:"
puts "Purpose: test storage/empty methods of bag and hand classes"
puts "Expected output:\n\t Bag\tHand"
puts "before:   2\t 2"
puts "after:    0\t 0"
puts "Test output:\n\t Bag\tHand"
puts "before:   #{bag_before_empty}\t #{hand_before_empty}"
puts "after:    #{bag_after_empty}\t #{hand_after_empty}"
if (bag_before_empty && hand_before_empty == 2) && (bag_after_empty && hand_after_empty == 0)
  puts "Test 9 passed"
  passed += 1
else
  puts "Test 9 failed"
  failed += 1
end

## Test 10 ##
total_tests += 1
name = "12345"
player2 = Player.new(name)
player_name = player2.name()

puts "\n\nTEST 10:"
puts "Purpose: test naming of players"
puts "Expected output: name = #{name}"
puts "Test output: name = #{player_name}"
if player_name == name && player_name.is_a?(String)
  puts "Test 10 passed"
  passed += 1
else
  puts "Test 10 failed"
  failed += 1
end

## Test 11 ##
total_tests += 1
sum = 0
player1.empty()
player1.clear()
die11 = Die.new(6, :"Green")
coin11 = Coin.new(0.25)
player1.store("TEST")
player1.store(die11)
player1.store(coin11)
player1.load()
player1.throw()
sum += die11.result() + coin11.side_to_int()
player1.throw()
sum += die11.result() + coin11.side_to_int()

puts "\n\nTEST 11:"
puts "Purpose: Test the sum methods of player/results"
puts "Expected output:"
puts "\tplayer sum: (int value between 2-14)" # 1 throw: min val = 1, max val = 7
puts "\trandomizer sum: (same value as above between 2-14)"
puts "Test output: "
puts "\tplayer sum: #{player1.sum().sum}"
puts "\trandomizer sum: #{sum}"
if player1.sum().sum == sum
  puts "Test 11 passed"
  passed += 1
else
  puts "Test 11 failed"
  failed += 1
end

## Test Stats ##
puts "\n\nTesting Stats:"
puts "Total Tests:      #{total_tests}"
puts "passed/failed:    #{passed}/#{failed}"
puts "pass percentage:  #{passed/total_tests.to_f*100.round(1)}%"