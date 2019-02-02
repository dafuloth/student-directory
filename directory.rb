@students = []

def interactive_menu
  loop do
    print_menu    	
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save list to file."
  puts "4. Load list from file."
  puts "9. Exit" # 9 because we'll be adding more items    
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    puts "Saving to file."
    save_students(get_filename)
  when "4"
    puts "Loading from file."
    load_students(get_filename)
  when "9"
    puts "Program will exit. See you soon!"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def get_filename()
  puts "Enter filename or just press return to use default (students.csv)."
  filename = STDIN.gets.chomp
  (filename == "") ? filename = "students.csv" : filename
end

def show_students
  print_header
  print_student_list
  print_footer
end


def print_header
  # print list of students
  puts "The students of Villains Academy"
  puts "-------------"
end

# Exercise 1: Modify print(students) to print numbered list of students,
# e.g. "1. Dr. Hannibal Lecter"
def print_student_list
  if !@students.empty?
    @students.each_with_index do |student, index|
      puts "#{index + 1}.#{index < 9 ? "  " : " "}#{student[:name]} (#{student[:cohort]} cohort)"

      # Ex5 - Output the additional information:
      # Ex6 - Align output with center(). Adding extra space above if needed
      puts "Biography: #{student[:bio]}".center(20 + student[:bio].length)
      puts "Nemesis: #{student[:nemesis]}".center(18 + student[:nemesis].length)
      puts
    end
  end
end

# Ex9. Message now appropriate for 1 student  
def print_footer
  # print number of students
  puts "Overall, we have #{@students.count} great student#{@students.count == 1 ? "" : "s"}."
end

def confirm_name(name)
  loop do
    puts "Storing data for student #{name}."
    puts "If incorrect, enter correct name now. Otherwise enter #{name} again to confirm."
    confirmation = STDIN.gets.chomp

    if confirmation.empty?
      puts "Name cannot be blank. Terminating."
      return ""
    end

    puts

    (name == confirmation) ? (return name) : (name = confirmation)    
  end
end

def confirm_cohort(cohort)
  loop do
    if cohort.to_s == ""
      puts "Blank input. Defaulting to current month: #{Time.now.strftime("%B")}."
      cohort = Time.now.strftime("%B").to_sym
    end

    puts "Student will be assigned #{cohort} cohort. Enter #{cohort} again to confirm:"

    confirmation = STDIN.gets.chomp

    puts

    (confirmation.upcase == cohort.to_s.upcase) ? (return cohort) : cohort = confirmation.to_sym
  end
end

# Ex7. Modify input_students to accept user input of cohort. Added error checking
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  puts "Enter the first student name:"

  # get the first name
  name = STDIN.gets.chomp
  puts

  # while the name is not empty, repeat the code
  while !name.empty? do

    name = confirm_name(name)
	
    break if name.empty?

    puts "#{name} must be assigned to a cohort. Please enter cohort."
    cohort = STDIN.gets.chomp.downcase.to_sym

    cohort = confirm_cohort(cohort)

    puts "Input biography for student:"
    bio = STDIN.gets.chomp

    puts "Who/what to keep this student away from - their nemesis:"
    nemesis = STDIN.gets.chomp

    puts "The student #{name} will be added to the #{cohort.to_s.capitalize} cohort."


    # add the student hash to the array
    add_student(name, cohort.to_sym, bio, nemesis)
    puts "Now we have #{@students.count} students"

    puts "Enter the next name: "
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

# Exercise 2: Program only prints students whose name begins a specified letter.
def print_selected(begins_with)
  puts "\nExercise 2: Students whose name begins with #{begins_with.upcase}:"
  # print(students) already exists so reuse the method
  print(@students.select { |student| student[:name][0].upcase == begins_with.upcase })
end

# Exercise 3: Only print the students whose name is shorter than 12 characters.
def print_shorter_names
  puts "\nExercise 3: Students whose names are shorter than 12 characters:"
  # print(students) already exists so reuse the method
  print(@students.select { |student| student[:name].length < 12 })
end

# Exercise 4: Rewrite the each() method to print all students using while or until 
def while_print
  puts "\nExercise 4: Same as print(students) but using a while loop:"

  counter = 0

  while counter < @students.count  
    puts "\n#{counter + 1}.#{counter < 9 ? "  " : " "}#{@students[counter][:name]} (#{@students[counter][:cohort]} cohort)"
    
    # Ex5 - Output the additional information:
    puts "Biography: #{@students[counter][:bio]}".center(20 + @students[counter][:bio].length)
    puts "Nemesis: #{@students[counter][:nemesis]}".center(18 + @students[counter][:nemesis].length)

    counter += 1
  end  
end

# Exercise 5: Adding information: short biography, nemesis (credit to wikipedia and https://villains.fandom.com)
def print_with_info
  puts "\nExercise 5: Added additional student info. Wrote code to output addtional info"
  if !@students.empty?
    @students.each_with_index do |student, index|
      puts "#{index + 1}.#{index < 9 ? "  " : " "}#{student[:name]} (#{student[:cohort]} cohort)"
      # Ex5 - Output the additional information:
      puts "Biography: #{student[:bio]}".center(20 + student[:bio].length)
      puts "Nemesis: #{student[:nemesis]}".center(18 + student[:nemesis].length)
      puts
    end
  end
end

# Exercise 6: Aligned output with center()

# Ex10: Alternatives to chomp
def chompless()
  puts "1. Using rstrip"
  by_rstrip = STDIN.gets.rstrip
  puts by_rstrip

  puts "2. Using chop"
  by_chop = STDIN.gets.chop
  puts by_chop

  puts "3: By specifying range"
  by_range = STDIN.gets[0...-1]
  puts by_range
end

def save_students(filename = "students.csv")
  # open the file for writing
#  file = File.open(filename, "w")
  # iterate over the array of students
#  @students.each do |student|
#    student_data = [student[:name], student[:cohort], student[:bio], student[:nemesis]]
#    csv_line = student_data.join(",")
#    file.puts csv_line
#  end
#  file.close

  File.open(filename, "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort], student[:bio], student[:nemesis]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end

  puts "Wrote data of #{@students.count} students to #{filename}."
end


def load_students(filename = "students.csv")

  if !@students.empty?

    puts "WARNING: Data of #{@students.count} already loaded. It will be lost if you proceed."

    puts "Enter Y to continue, or anything else to return to menu."

    if (STDIN.gets.chomp.upcase == "Y")
      @students = []
    else
      interactive_menu
    end

  end

  if File.exists?(filename)
#    file = File.open(filename, "r")
#    file.readlines.each do |line|
#      name, cohort, bio, nemesis = line.chomp.split(',')  
#      add_student(name, cohort.to_sym, bio, nemesis)    
#    end
#    file.close

    File.open(filename, "r") do |file|
      file.readlines.each do |line|
        name, cohort, bio, nemesis = line.chomp.split(',')
        add_student(name, cohort.to_sym, bio, nemesis)
      end
    end

    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "The file #{filename} was not found. No data loaded."
  end
end


def add_student(name, cohort, bio, nemesis)
  @students << {name: name, cohort: cohort.to_sym, bio: bio, nemesis: nemesis}
end

def try_load_students
  filename = ARGV.first # first argument from the command line

  if filename.nil?
    # if no argument given, see if we can use students.csv
    if File.exists?("students.csv")
      filename = "students.csv"
      puts "File not specified, or not found. Using existing students.csv instead."
    else
      return
    end
  elsif !File.exists?(filename) 
    # filename given but not valid
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
  
  # if this code still running, filename is valid. Load it.
  load_students(filename)
  
end

try_load_students
interactive_menu
