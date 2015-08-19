class Book
  attr_reader(:title, :author, :id)

  define_method(:initialize) do |attributes|
    @title = attributes.fetch(:title)
    @author = attributes.fetch(:author)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_books = DB.exec("Select * FROM books;")
    books = []
    returned_books.each() do |book|
      title = book.fetch("title")
      author = book.fetch("author")
      id = book.fetch("id").to_i()
      books.push(Book.new({:title => title, :author => author, :id => id}))
    end
    books
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO books (title, author) VALUES ('#{@title}', '#{@author}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_book|
    self.title().==(another_book.title()).&(self.id().==(another_book.id()))
  end

  define_singleton_method(:find) do |id|
    found_book = nil
    Book.all().each() do |book|
      if book.id().==(id)
        found_book = book
      end
    end
    found_book
  end

  define_method(:patrons) do
    list_patrons = []
    patrons = DB.exec("SELECT * FROM patrons WHERE book_id = #{self.id()};")
    patrons.each() do |patron|
      name = patron.fetch("name")
      phone_number = patron.fetch("phone_number")
      book_id = patron.fetch("book_id").to_i()
      list_patrons.push(Patron.new({:title => "Harry Potter", :author => "J. K Rowling", :id => nil}))
    end
    list_patrons
  end

end
