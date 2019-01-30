# put students into array
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]

def print_header
  # print list of students
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  # print number of students
  puts "Overall, we have #{names.count} great students."
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students =[]
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat the code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

# Exercise 2: Program only prints students whose name begins a specified letter.
def print_selected(students, begins_with)
  puts "\nStudents whose name begins with #{begins_with.upcase}:"
  # print(students) already exists so reuse the method
  print(students.select { |student| student[:name][0].upcase == begins_with.upcase })
  puts
end

# nothing happens until methods called
# students = input_students

print_header

print(students) # Exercise 1

print_footer(students)

print_selected(students, "t") # Exercise 2


