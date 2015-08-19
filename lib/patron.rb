class Patron
  attr_reader(:name, :phone_number, :book_id, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @phone_number = attributes.fetch(:phone_number)
    @book_id = attributes.fetch(:book_id)
    # @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_patrons = DB.exec("Select * FROM patrons;")
    patrons = []
    returned_patrons.each() do |patron|
      name = patron.fetch("name")
      book_id = patron.fetch("book_id").to_i()
      phone_number = patron.fetch("phone_number")
      id = patron.fetch("id").to_i()
      patrons.push(Patron.new({:name => name, :phone_number => phone_number, :book_id => book_id, :id => nil}))
    end
    patrons
  end

  define_method(:save) do
    results = DB.exec("INSERT INTO patrons (name, phone_number, book_id) VALUES ('#{@name}', '#{@phone_number}', #{@book_id}) RETURNING id;")
    @id = results.first().fetch('id')
  end

  define_method(:==) do |another_patron|
    self.name().==(another_patron.name()).&(self.book_id().==(another_patron.book_id())).&(self.phone_number().==(another_patron.phone_number()))
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name, @name)
    @phone_number = attributes.fetch(:phone_number, @phone_number)
    @book_id = attributes.fetch(:book_id)
    @id = self.id()
    DB.exec("UPDATE patrons SET name = '#{@name}', phone_number = '#{@phone_number}', book_id = #{@book_id} WHERE id = #{id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM patrons WHERE id = #{self.id()};")
  end

end
