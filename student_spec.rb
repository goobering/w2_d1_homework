require 'Minitest/autorun'
require 'Minitest/rg'

require_relative 'student'

class TestStudent < MiniTest::Test

def setup()
  @student = Student.new("John", 2)
end

def test_create_student()
  assert_equal(true, @student.is_a?(Student))
end

def test_get_student_name()
  assert_equal("John", @student.get_name())
end

def test_get_student_cohort()
  assert_equal(2, @student.get_cohort())
end

def test_set_student_name()
  @student.set_name("Alan")
  assert_equal("Alan", @student.get_name())
end

def test_set_student_cohort()
  @student.set_cohort(3)
  assert_equal(3, @student.get_cohort())
end

def test_student_talk()
  assert_equal("I can talk!", @student.talk())
end

def test_student_say_favourite()
  assert_equal("Ruby", @student.say_favourite_language("Ruby"))
end

end