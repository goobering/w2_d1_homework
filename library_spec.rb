require 'Minitest/autorun'
require 'Minitest/rg'

require_relative 'library'

class TestLibrary < MiniTest::Test

def setup()
  books = []
  @library = Library.new(books)
  @book1 = { 
    title: "lord_of_the_rings",
    rental_details: { 
     student_name: "Jeff", 
     date: "01/12/16"
    }
  }
  @book2 = { 
      title: "lord_of_the_flies",
      rental_details: { 
       student_name: "Steve", 
       date: "01/01/16"
    }
  }
end

def test_list_books()
  # Add 1 book to the library
  @library.add_book(@book1)

  # Get all books (only 1 book / 4 lines) from library
  books = @library.list_books()
  # Split return array at newline chars
  book_array = books.split("\n")

  # Test each line of return value
  assert_equal("Title: lord_of_the_rings", book_array[0])
  assert_equal("Rental details:", book_array[1])
  assert_equal("Student name: Jeff", book_array[2])
  assert_equal("Date: 01/12/16", book_array[3])
end

def test_get_book_details()
  @library.add_book(@book1)

  book = @library.get_book_details("lord_of_the_rings")
  book_array = book.split("\n")

  assert_equal("Title: lord_of_the_rings", book_array[0])
  assert_equal("Rental details:", book_array[1])
  assert_equal("Student name: Jeff", book_array[2])
  assert_equal("Date: 01/12/16", book_array[3])
end

def test_get_book_rental_details()
  @library.add_book(@book1)

  details = @library.get_book_rental_details("lord_of_the_rings")
  details_array = details.split("\n")

  assert_equal("Rental details:", details_array[0])
  assert_equal("Student name: Jeff", details_array[1])
  assert_equal("Date: 01/12/16", details_array[2])
end

def test_add_book_by_title()
  new_book = { 
    title: "new_book_title",
    rental_details: { 
     student_name: "", 
     date: ""
    }
  }

  @library.add_book_by_title("new_book_title")

  book = @library.get_book_details("new_book_title")
  book_array = book.split("\n")

  assert_equal("Title: new_book_title", book_array[0])
  assert_equal("Rental details:", book_array[1])
  assert_equal("Student name: ", book_array[2])
  assert_equal("Date: ", book_array[3])
end

# Create a method that changes the rental details of a book by taking in the title of the book, the student renting it and the date it's due to be returned.

def test_change_book_rental_details()
  @library.add_book(@book1)

  @library.change_book_rental_details("lord_of_the_rings", "Dan", "09/05/2018")

  details = @library.get_book_rental_details("lord_of_the_rings")
  details_array = details.split("\n")

  assert_equal("Rental details:", details_array[0])
  assert_equal("Student name: Dan", details_array[1])
  assert_equal("Date: 09/05/2018", details_array[2])
end

end