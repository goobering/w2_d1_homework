class Library

def initialize(books)
  @books = books
end

# { 
#     title: "lord_of_the_rings",
#     rental_details: { 
#      student_name: "Jeff", 
#      date: "01/12/16"
#     }
# }

def add_book(book)
  @books.push(book)
end

def add_book_by_title(book_title)
  new_book = { 
    title: book_title,
    rental_details: { 
     student_name: "", 
     date: ""
      }
    }
  @books.push(new_book)
end

def list_books()
  for book in @books
    return "Title: #{book[:title]}\nRental details:\nStudent name: #{book[:rental_details][:student_name]}\nDate: #{book[:rental_details][:date]}"
  end
end

def get_book_details(book_title)
  for book in @books
    if book[:title] == book_title
      return "Title: #{book[:title]}\nRental details:\nStudent name: #{book[:rental_details][:student_name]}\nDate: #{book[:rental_details][:date]}"
    end
  end
end

def get_book_rental_details(book_title)
  for book in @books
    if book[:title] == book_title
      return "Rental details:\nStudent name: #{book[:rental_details][:student_name]}\nDate: #{book[:rental_details][:date]}"
    end
  end
end

def change_book_rental_details(book_title, student_name, return_date)
  for book in @books
    if book[:title] == book_title
      book[:rental_details][:student_name] = student_name
      book[:rental_details][:date] = return_date
    end
  end
end

end