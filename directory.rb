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
    
    student_count = 1
    
    students.each do |student|
      
      student.each do |k, v|
         
        if k == :name && (initial == "" || initial == v[0].downcase)
          unless (exclusion[0] == "y" && v.length > 12)
            puts "#{student_count}. #{student[:name]} (#{student[:cohort]} cohort)"
            student_count += 1
          end
        end
        
      end
    
    end
  
    puts "Overall we have #{@students.count} great student#{"s" unless @students.count == 1}."
  end
  
end

# calling methods

until $quit == "yes" do
  @students = [] if @students == nil
  master_method
end