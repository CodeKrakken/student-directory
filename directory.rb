# defining methods
def master_method
  puts "Enter, retrieve or quit?"
  command = gets.chomp.downcase
  case command.chr
  when "e"
    input_students
  when "r"
    retrieve(@students)
  when "q"
    puts " ... be seeing you ..."
    $quit = "yes"
  end
end


def input_students
  puts "Please enter the names of the students\nTo finish, just hit return twice"
  name = gets.chomp
  
  while !name.empty? do
    @students << {:name => name, :cohort => :november}
    puts "Now we have #{@students.count} student#{"s" unless @students.count == 1}."
    name = gets.chomp
  end
end

def retrieve(students)
  if @students.count == 0
    puts "We have no students."
  else
    puts "Please enter initial or leave blank to see all."
    initial = gets.chomp.downcase
    exclusion = ""
    
    until exclusion[0] == "y" || exclusion[0] == "n" do
      puts "Exclude long names? (yes/no)"
      exclusion = gets.chomp.downcase
    end
    
    index = 0
    display_count = 1
    
    until students[index] == nil do
      
      if initial == "" || initial == students[index][:name][0].downcase
        
        unless exclusion[0] == "y" && students[index][:name].length > 12
          puts "#{display_count}. #{students[index][:name]} (#{students[index][:cohort]} cohort)"
          display_count += 1
        end
        
      end
      index += 1
      
    end
    
    puts "Overall we have #{@students.count} great student#{"s" unless @students.count == 1}."
  end
  
end

# calling methods

until $quit == "yes" do
  @students = [] if @students == nil
  master_method
end