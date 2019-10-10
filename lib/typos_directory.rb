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
      @filename = nil
      @apology = "not due"
      specify_filename while (@filename.nil? || !File.exist?(@filename))
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
  store_students
  puts "Now we have #{@students.count} students"
  # get another name from the user
  @name, @cohort = STDIN.gets.chomp.split(",")
  end
end


def specify_filename
  sorry = "Sorry, #{@filename} doesn't exist. "
  please = "Please specify filename, or leave blank for default."
  puts sorry if @apology == "due"
  puts please
  @filename = STDIN.gets.chomp
  @filename = "default.csv" if @filename == ""
  
  if !File.exist?(@filename)
    @apology = "due"
  end
end



def save_students
  @apology = "not due"
  specify_filename
  File.open(@filename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
  puts "Save successful!"
end


def store_students
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

    
def first_run_load
  @filename = ARGV.first
  @filename = "default.csv" if @filename.nil?
  
  if !File.exist?(@filename)
    @apology = "due"
    specify_filename while !File.exist?(@filename)
  end
  
  load_students(@filename)
end


def load_students(filename)
  File.open(@filename, "r") do |file|
    new_students = 0
    file.readlines.each do |line|
      @name, @cohort = line.chomp.split(",")
      new_students += 1
      store_students
    end
  puts "Loaded #{new_students} from #{@filename}"
  end
end

first_run_load
interactive_menu