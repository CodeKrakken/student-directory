# defining methods

def master_method
  puts "Enter, add details, retrieve, or quit?"
  command = gets.gsub!("\n", "").downcase
  case command.chr
  when "e"
    input_students
  when "a"
    add_detail
  when "r"
    retrieve(@students)
  when "q"
    puts " ... be seeing you ..."
    $quit = "yes"
  end
end


def input_students
  
  puts "Please enter name and cohort, separated by a comma."
  name = gets.gsub!("\n", "").split(",")
  name[0].strip! unless name[0] == nil
  name[0] = nil if name[0] == "" 

  until name[0] == nil do
    
    name.each do |element|
      element.gsub!("\n", "")
    end
    
    name[1] = "no" if name[1] == nil
    name[1].gsub!(" ", "")
    name[1] = "no" unless (@cohorts.include? name[1].capitalize)
    
    @students << {:name => name[0], :cohort => name[1].downcase.to_sym}
    puts "Now we have #{@students.count} student#{"s" unless @students.count == 1}."
    name = gets.gsub!("\n", "").split(",")
  end
end


def add_detail
  
  if @students.count == 0
    puts "We have no students."
  else
    student_to_find = "placeholder"
    
    until student_to_find == ""
      puts "Please enter student name or leave blank to return to main menu."
      student_to_find = gets.gsub!("\n", "")
    
      unless student_to_find == ""
        index = 0
        until @students[index] == nil
        
          if @students[index][:name] == student_to_find
              puts "What type of detail are you adding?"
              new_key = gets.chomp
              puts "Please enter detail."
              new_detail = gets.gsub!("\n", "")
              @students[index].merge!{new_key}
              @students[index][new_key] = new_detail
              @found = true
          end
        index += 1  
        end
      
        if @found == true
          puts "Data saved."
          @found = false
        else
          puts "Student not found."
        end
      end
    end
  end
end


def retrieve(students)
  if @students.count == 0
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
    
    until @cohorts[index] == nil do
      
      students.each do |student|
      
        if initial == "" || initial == student[:name][0].downcase
        
          unless exclusion[0] == "y" && student[:name].length > 12
        
              if student[:cohort].to_s == @cohorts[index].downcase
                puts "#{display_count}. #{student[:name]} (#{@cohorts[index]} cohort)".center(@lineWidth)
                display_count += 1
              end
              
          end
        
        end
        
      end
      index += 1
      
    end
    
    puts "\n"
    puts "Overall we have #{@students.count} great student#{"s" unless @students.count == 1}.".center(@lineWidth)
    puts "\n"
  end
  
  puts "Enter name to see full details. Press enter to return to main menu"
  name = gets.gsub!("\n", "")
  
  unless name == ""
    index = 0
    
      until @students[index] == nil
        
        if @students[index][:name] == name
          
          @students[index].each do |k, v|
            puts "#{k}: #{v}".center(@lineWidth)
          end
        
          puts "\n"
        end
        
      index += 1  
      end
      
  end
    
end

# calling methods

until $quit == "yes" do
  @lineWidth = 100
  @cohorts = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December", "no"]
  @students = [] if @students == nil
  master_method
end