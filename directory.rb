@students = []

def interactive_menu
  loop do

    print_menu

    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      show_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit" # 9 because we'll be adding more items    
end

def show_students
  print_header
  print(students)
  print_footer(students)
end

# put students into array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november,
    bio: "A respected Baltimore socialite and renowned forensic psychiatrist. Also a cunning, highly-intelligent, cannibalistic and psychopathic serial-killer",
    nemesis: "Clarice Starling" },

  {name: "Darth Vader", cohort: :november,
   bio: "a.k.a. Anakin Skywalker. Originally a Jedi prophesied to bring balance to the Force, Anakin Skywalker is lured to the dark side",
   nemesis: "Obi-Wan Kenobi" },

  {name: "Nurse Ratched", cohort: :november,
   bio: "A cold, heartless, and passive-aggressive tyrant, Nurse Ratched became the stereotype of the nurse as a battleaxe",
   nemesis: "none" },

  {name: "Michael Corleone", cohort: :november, 
   bio: "Don Michael Corleone was the head of the Corleone family after Vito Corleone stepped down",
   nemesis: "Rival families" },

  {name: "Alex DeLarge", cohort: :november,
   bio: "A sociopath who robs, rapes, and assaults innocent people for his own amusement",
   nemesis: "Ludovico Technique" },

  {name: "The Wicked Witch of the West", cohort: :november,
   bio: "Ruler of Winkie Country. Good with animals. Aquaphobic", 
   nemesis: "Dorothy Gale" },

  {name: "Terminator", cohort: :november,
   bio: "From the future. The Terminator is a cybernetic organism. Living tissue over metal endoskeleton",
   nemesis: "John Connor" },

  {name: "Freddy Krueger", cohort: :november,
   bio: "Serial killer who uses a gloved hand with razors to kill his victims in their dreams, causing their deaths in the real world as well", 
   nemesis: "Fire" },

  {name: "The Joker", cohort: :november,
   bio: "A highly intelligent and manipulative criminal with a twisted and sadistic sense of humor",
   nemesis: "Batman" },

  {name: "Joffrey Baratheon", cohort: :november,
   bio: "The second Baratheon king to sit on the Iron Throne. Sparked the War of the Five Kings",
   nemesis: "Olenna Tyrell" },

  {name: "Norman Bates", cohort: :november,
   bio: "Runs the Bates Motel in Fairvale, with his mother",
   nemesis: "Mother" }
]

def print_header
  # print list of students
  puts "The students of Villains Academy"
  puts "-------------"
end

# Exercise 1: Modify print(students) to print numbered list of students,
# e.g. "1. Dr. Hannibal Lecter"
def print(students)
  if !students.empty?
    students.each_with_index do |student, index|
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
def print_footer(names)
  # print number of students
  puts "Overall, we have #{names.count} great student#{names.count == 1 ? "" : "s"}."
end

# Ex7. Modify input_students to accept user input of cohort. Added error checking
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students =[]

  puts "Enter the first student name:"

  # get the first name
  name = gets.chomp
  puts

  # while the name is not empty, repeat the code
  while !name.empty? do

    confirmation = ""

    loop do
      puts "Storing data for student #{name}."
      puts "If incorrect, enter correct name now. Otherwise enter #{name} again to confirm."

      confirmation = gets.chomp

      if confirmation.empty?
        puts "Name cannot be blank. Terminating."
        break
      end

      puts

      if name == confirmation
        break
      else
        name = confirmation
      end
    end

    break if confirmation.empty?

    puts "#{name} must be assigned to a cohort. Please enter cohort."
    cohort = gets.chomp.downcase.to_sym

    loop do
      if cohort.to_s == ""
        puts "Blank input. Defaulting to current month: #{Time.now.strftime("%B")}."
        cohort = Time.now.strftime("%B").to_sym
      end

    puts "#{name} will be assigned cohort #{cohort}. Enter #{cohort} again to confirm:"
  
    confirmation = gets.chomp

    puts

      if confirmation.upcase == cohort.to_s.upcase
        break
      else
        cohort = confirmation.to_sym
      end

    end

    puts "Who/what to keep this student away from - their nemesis:"
    nemesis = gets.chomp

    puts "Input biography for student:"
    bio = gets.chomp

    puts "The student #{name} will be added to the #{cohort.to_s.capitalize} cohort."


    # add the student hash to the array
    students << {name: name, cohort: cohort, bio: bio, nemesis: nemesis}
    puts "Now we have #{students.count} students"

    puts "Enter the next name: "
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

# Exercise 2: Program only prints students whose name begins a specified letter.
def print_selected(students, begins_with)
  puts "\nExercise 2: Students whose name begins with #{begins_with.upcase}:"
  # print(students) already exists so reuse the method
  print(students.select { |student| student[:name][0].upcase == begins_with.upcase })
end

# Exercise 3: Only print the students whose name is shorter than 12 characters.
def print_shorter_names(students)
  puts "\nExercise 3: Students whose names are shorter than 12 characters:"
  # print(students) already exists so reuse the method
  print(students.select { |student| student[:name].length < 12 })
end

# Exercise 4: Rewrite the each() method to print all students using while or until 
def while_print(students)
  puts "\nExercise 4: Same as print(students) but using a while loop:"

  counter = 0

  while counter < students.count  
    puts "\n#{counter + 1}.#{counter < 9 ? "  " : " "}#{students[counter][:name]} (#{students[counter][:cohort]} cohort)"
    
    # Ex5 - Output the additional information:
    puts "Biography: #{students[counter][:bio]}".center(20 + students[counter][:bio].length)
    puts "Nemesis: #{students[counter][:nemesis]}".center(18 + students[counter][:nemesis].length)

    counter += 1
  end  
end

# Exercise 5: Adding information: short biography, nemesis (credit to wikipedia and https://villains.fandom.com)
def print_with_info(students)
  puts "\nExercise 5: Added additional student info. Wrote code to output addtional info"
  if !students.empty?
    students.each_with_index do |student, index|
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
  by_rstrip = gets.rstrip
  puts by_rstrip

  puts "2. Using chop"
  by_chop = gets.chop
  puts by_chop

  puts "3: By specifying range"
  by_range = gets[0...-1]
  puts by_range
end

# nothing happens until methods called

# uncomment the next line to take data from user input
# students = input_students

# print_header

# print(students) # Exercise 1

# print_footer(students)

# print_selected(students, "t") # Exercise 2

# print_shorter_names(students) # Exercise 3

# while_print(students) # Exercise 4

# print_with_info(students) # Exercise 5

#chompless # Exercise 10


## Program entry point ##
interactive_menu

