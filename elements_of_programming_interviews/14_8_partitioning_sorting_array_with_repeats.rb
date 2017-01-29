require 'pp'

#Student object, each has 'age' integer field.
#Given array of students, re-arrange so those of same age are grouped together.  Does not have to be in order.

class Student
  attr_reader :age

  def initialize(age)
    @age = age
  end

  def to_s
    @age
  end
end

#Input array of students
#Output - modifies array such that students are grouped by age
#[3,3,2,2,4,4] len 5
#write_index 1
#value 3
def group_by_age(array)
  return if array.length < 2

  write_index = 0

  while write_index < array.length - 1
    age = array[write_index].age
    array[write_index], array[-1] = array[-1], array[write_index]

    (write_index..array.length - 1).each do |i|
      if array[i].age == age
        array[write_index], array[i] = array[i], array[write_index]
        write_index += 1
      end
    end
  end
end

#Uses a hash of subarrays of each age.
def group_by_age_hash(array)
  return if array.length < 2

  students = Hash.new

  array.each do |s|
    if students[s.age]
      students[s.age] << s
    else
      students[s.age] = [s]
    end
  end

  write_index = 0

  students.each do |students_by_age|
    students_by_age[1].each do |s|
      array[write_index] = s
      write_index += 1
    end
  end

end

students = []
students << Student.new(19)
students << Student.new(20)
students << Student.new(21)
students << Student.new(22)
students << Student.new(19)
students << Student.new(20)
students << Student.new(21)
students << Student.new(22)
students << Student.new(19)


puts students.map { |s| s.to_s }.join(',')
group_by_age_hash(students)
puts students.map { |s| s.to_s }.join(',')
