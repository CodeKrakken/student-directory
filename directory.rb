# let's put all the students in an array!

students = ["Freddy Krueger", "The Terminator", "Darth Vader", "Nurse Radchet", "Alex DeLarge",
"The Joker", "Michael Corleone", "Dr Hannibal Lecter", "Norman Bates", "Joffrey Baratheon",
"The Wicked Witch of the West"]

def print_header
  puts "The Students of Villains Academy"
  puts "--------------------------------"
end

def print(names)
  names.each do |name|
  puts name
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} great students."
end

# nothing happens until we call the methods

print_header
print(students)
print_footer(students)