# let's put all the students in an array!

=begin
students = [
{:name => "Freddy Krueger", :cohort => :november},
{:name => "The Terminator", :cohort => :november},
{:name => "Darth Vader", :cohort => :november},
{:name => "Nurse Radchet", :cohort => :november},
{:name => "Alex DeLarge", :cohort => :november},
{:name => "The Joker", :cohort => :november},
{:name => "Michael Corleone", :cohort => :november},
{:name => "Dr Hannibal Lecter", :cohort => :november},
{:name => "Norman Bates", :cohort => :november},
{:name => "Joffrey Baratheon", :cohort => :november},
{:name => "The Wicked Witch of the West", :cohort => :november}]
=end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  
  while !name.empty? do
    students << {:name => name, :cohort => :november}
    puts "Now we have #{students.count} student#{"s" if students.count > 1}."
    name = gets.chomp
  end
  students
end

  
def print_header
  puts "The Students of Villains Academy"
  puts "--------------------------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} great student#{"s" if names.count > 1}."
end

# nothing happens until we call the methods

students = input_students
print_header
print(students)
print_footer(students)