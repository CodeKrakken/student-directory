@students = []


def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list"
    puts "4. Load the list"
    puts "9. Exit"
end


def show_students
  print_header
  print_student_list
  print_footer
end


def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students(@filename)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end


def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end    


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  @name, @cohort = STDIN.gets.chomp.split(",")
  # while the name is not empty, repeat this code
  while !@name.nil? do
  # add the student hash to the array
  @cohort = "no" if @cohort.nil?
  get_students
  puts "Now we have #{@students.count} students"
  # get another name from the user
  @name, @cohort = STDIN.gets.chomp.split(",")
  end
end


def specify_filename
  puts "Please specify filename, or blank for default."
  @filename = gets.chomp
  @filename = "default.csv" if @filename == ""
end


def load_students(filename)
  loop do
    specify_filename
    if File.exist?(@filename)
      break
    else
      puts "Sorry, #{@filename} doesn't exist."
    end
  end

  file = File.open(@filename, "r")
  file.readlines.each do |line|
    @name, @cohort = line.chomp.split(",")
    get_students
  end
  file.close
  puts "Loaded #{@students.count} from #{@filename}"
end


def save_students
  specify_filename
  file = File.open(@filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Save successful!"
end


def get_students
  @students << {name: @name, cohort: @cohort.to_sym}
end


def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end


def print_student_list
    @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end


def print_footer
  puts "Overall, we have #{@students.count} great students"
end

    
def try_load_students
  @filename = ARGV.first
  @filename = "default.csv" if @filename.nil?
  if File.exist?(@filename)
    load_students(@filename)
  else
    puts "Sorry, #{@filename} doesn't exist."
    exit
  end
end


try_load_students
interactive_menu