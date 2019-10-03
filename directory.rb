# let's put all the students in an array!

students = ["Freddy Krueger", "The Terminator", "Darth Vader", "Nurse Radchet", "Alex DeLarge",
"The Joker", "Michael Corleone", "Dr Hannibal Lecter", "Norman Bates", "Joffrey Baratheon",
"The Wicked Witch of the West"]

# and then print them.

puts "The Students of Villains Academy"
puts "--------------------------------"

students.each do |student|
  puts student
end

# finally, we print the total

puts "Overall we have #{students.count} great students."