# defining methods

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  
  while !name.empty? do
    students << {:name => name, :cohort => :november}
    puts "Now we have #{students.count} student#{"s" unless students.count == 1}."
    name = gets.chomp
  end
  
  students
end

def print_header
  puts "The Students of Villains Academy"
  puts "--------------------------------"
end

def print(students)
  student_count = 1
  students.each do |student|
    puts "#{student_count}. #{student[:name]} (#{student[:cohort]} cohort)"
    student_count += 1
  end
end

def print_footer(names)
  
  if names.count == 0 
    puts "We have no students"
  else
    puts "Overall we have #{names.count} great student#{"s" unless names.count == 1}."
  end

end

# calling methods

students = input_students
print_header
print(students)
print_footer(students)