def first_run_load
  @filename = ARGV.first
  @filename = "default.csv" if @filename.nil?
  
  if !File.exist?(@filename)
    @apology = "due"
    specify_filename while !File.exist?(@filename)
  end
  
  load_students(@filename)
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


def load_students(filename)
  new_students = 0
  CSV.foreach(@filename) do |line|   
    @name, @cohort = line
    new_students += 1
    store_students
  end
  puts "Loaded #{new_students} from #{@filename}"
end


def store_students
  @students << {name: @name, cohort: @cohort.to_sym}
end


def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end    


def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list"
    puts "4. Load the list"
    puts "5. Add details to student record"
    puts "9. Exit"
end


def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students(@students)
    when "3"
      save_students
    when "4"
      @filename = nil
      @apology = "not due"
      specify_filename while (@filename.nil? || !File.exist?(@filename))
      load_students(@filename)
    when "5"
      add_detail
    when "9"
      puts " ... be seeing you ..."
      exit
    else
      puts "I don't know what you meant, try again"
  end
end


def input_students
  loop do
    puts "Please enter name and cohort, separated by a comma."
    puts "Leave it blank to return to the main menu"
    @name, @cohort = STDIN.gets.chomp.split(",")
    return if @name == nil
    @cohort = "no" if @cohort.nil?
    @name.strip!
    @cohort.strip!
    @cohort = "no" unless (@cohorts.include? @cohort.downcase.capitalize)
      store_students
      puts "Now we have #{@students.count} students"
  end
end


def show_students(students)
  if students.count == 0
    puts "We have no students."
    return
  else
    puts "Please enter initial or leave blank to see all."
    initial = gets.gsub!("\n", "").downcase
    exclusion = ""
  
    until exclusion[0] == "y" || exclusion[0] == "n" do
        puts "Exclude long names?"
        exclusion = gets.gsub!("\n", "").downcase
    end
  
  index = 0
    display_count = 1
    print_header
    until @cohorts[index] == nil do
      
      students.each do |student|
      
        if initial == "" || initial == student[:name][0].downcase
        
          unless exclusion[0] == "y" && student[:name].length > 12
          
              if student[:cohort].to_s.downcase == @cohorts[index].downcase
                puts "#{display_count}. #{student[:name]} (#{@cohorts[index]} cohort)".center(@lineWidth)
                display_count += 1
              end
              
          end
        
        end
        
      end
      index += 1
      
    end
    
    puts "\n"
    puts "Overall we have #{students.count} great student#{"s" unless students.count == 1}.".center(@lineWidth)
    puts "\n"
  end
  
  puts "Enter name to see full details. Press enter to return to main menu"
  name = gets.gsub!("\n", "")
  
  unless name == ""
    index = 0
    
      until students[index] == nil
      
        if students[index][:name] == name
          
          students[index].each do |k, v|
            puts "#{k}: #{v}".center(@lineWidth)
          end
        
        end
        puts "\n"
      index += 1  
      end
      
  end
    
end


def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end


def save_students
  @apology = "not due"
  specify_filename
  
  CSV.open(@filename, "wb") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
  puts "Save successful!"
end


def add_detail
  
  if @students.count == 0
    puts "We have no students."
  else
    
    loop do
      
      @found = false
      puts "Please enter student name or leave blank to return to main menu."
      student_to_find = gets.gsub!("\n", "")
      break if student_to_find == ""
        index = 0
        
        until @students[index] == nil
        
          if @students[index][:name] == student_to_find
            
            loop do
              puts "What type of detail are you adding?"
              new_key = gets.chomp
              break if new_key == ""
              puts "Please enter detail."
              new_detail = gets.gsub!("\n", "")
              @students[index][new_key.to_sym] = new_detail
              puts "Data saved."
              @found = true
            end
            
          end
          
        index += 1  
        end
        
      puts "Student not found." unless @found == true
      end
  end
    
end
  


require 'csv'
@lineWidth = 100
@cohorts = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", "no"]
@students = []
first_run_load
interactive_menu