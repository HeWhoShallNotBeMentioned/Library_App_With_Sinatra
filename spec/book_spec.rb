require('spec_helper')


describe(Book) do
  describe(".all") do
    it("starts off with no books") do
      expect(Book.all()).to(eq([]))
    end
  end


  describe("#title") do
    it("tells you its title") do
      book = Book.new({:title => "Harry Potter", :author => "JK Rowling", :id => nil})
      expect(book.title()).to(eq("Harry Potter"))
    end
  end

  describe("#author") do
    it("tells you the author") do
      book = Book.new({:title => "Harry Potter", :author => "JK Rowling", :id => nil})
      expect(book.author()).to(eq("JK Rowling"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      book = Book.new({:title => "Harry Potter",:author => "JK Rowling", :id => nil})
      book.save()
      expect(book.id()).to(be_an_instance_of(Fixnum))
    end
  end


  describe("#save") do
    it("lets you save books to the database") do
      books = Book.new({:title => "Harry Potter", :author => "J. K Rowling", :book_id => 1, :id => nil})
      books.save()
      expect(Book.all()).to(eq([books]))
    end
  end

  describe("#==") do
    it("is the same books if it has the same title") do
      books1 = Book.new({:title => "Harry Potter", :author => "J. K Rowling", :id => nil})
      books2 = Book.new({:title => "Harry Potter", :author => "J. K Rowling", :id => nil})
      expect(books1).to(eq(books2))
    end
  end

  describe('.find') do
    it('returns a book by its ID') do
      test_books = Book.new({:title => "Harry Potter", :author => "J. K Rowling", :id => nil})
      test_books.save()
      test_books2 = Book.new({:title => "Home Stuff", :author => "J. K Rowling", :id => nil})
      test_books2.save()
      expect(Book.find(test_books2.id())).to(eq(test_books2))
    end
  end

  describe("#patrons") do
    it('returns an array of patrons for that book') do
      test_book = Book.new({:title => "Harry Potter", :author => "J. K Rowling", :id => nil})
      test_book.save()
      test_patron = Patron.new({:name => "Blob", :phone_number => "666 666 6666",:book_id => test_book.id(), :id => nil})
      test_patron.save()
      test_patron2 = Patron.new({:name => "Brob", :phone_number => "777 777 7777", :book_id => test_book.id(), :id => nil})
      test_patron2.save()
      expect(test_book.patrons()).to(eq([test_patron, test_patron2]))
    end
  end

  describe("#update") do
    it("lets you update book lists in the database") do
      book = Book.new({:title => "Harry Potter", :author => "J K Rowling", :id => nil})
      book.save()
      book.update({:title => "The Order of Phoenix", :author => "JK Rowling"})
      expect(book.title()).to(eq('The Order of Phoenix'))
      expect(book.author()).to(eq('JK Rowling'))
    end
  end

  describe("#delete") do
    it("lets you delete a book from the database") do
      book = Book.new({:title => "Harry Potter", :author => "J K Rowling", :id => nil})
      book.save()
      book2 = Book.new({:title => "The Order of Phoenix", :author => "JK Rowling", :id => nil})
      book2.save()
      book.delete()
      expect(Book.all()).to(eq([book2]))
    end
  end

end
