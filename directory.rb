# let's put all the students in an array!

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
  puts "Overall we have #{names.count} great students."
end

# nothing happens until we call the methods

print_header
print(students)
print_footer(students)