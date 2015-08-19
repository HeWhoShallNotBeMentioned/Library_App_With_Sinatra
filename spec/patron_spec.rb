require('spec_helper')

describe(Patron) do
  describe(".all") do
    it("starts off with no patrons") do
      expect(Patron.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a patron to the table patrons") do
      test_patron = Patron.new({:name => "Schlmo Abramowitz", :phone_number => "503 888 8888", :book_id => 1, :id => nil })
      test_patron.save()
      expect(Patron.all()).to(eq([test_patron]))
    end
  end

  describe("#name") do
    it("returns the patron name") do
      test_patron = Patron.new({:name => "Schlmo Abramowitz", :phone_number => "503 888 8888", :book_id => 1, :id => nil })
      expect(test_patron.name()).to(eq("Schlmo Abramowitz"))
    end
  end

  describe("#phone_number") do
    it("returns the patron phone_number") do
      test_patron = Patron.new({:name => "Schlmo Abramowitz", :phone_number => "503 888 8888", :book_id => 1, :id => nil })
      expect(test_patron.phone_number()).to(eq("503 888 8888"))
    end
  end

  describe("#book_id") do
    it("returns the patron book_id") do
      test_patron = Patron.new({:name => "Schlmo Abramowitz", :phone_number => "503 888 8888", :book_id => 1, :id => nil})
      expect(test_patron.book_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same patron if it has the same name") do
      patron1 = Patron.new({:name => "Schlmo Abramowitz", :phone_number => "503 888 8888", :book_id => 1, :id => nil})
      patron2 = Patron.new({:name => "Schlmo Abramowitz", :phone_number => "503 888 8888", :book_id => 1, :id => nil })
      expect(patron1).to(eq(patron2))
    end
  end

  describe("#update") do
    it("lets you update patron lists in the database") do
      patron = Patron.new({:name => "Schlmo Abramowitz", :phone_number => "503 888 8888", :book_id => 1, :id => nil })
      patron.save()
      patron.update({:name => "Harry Dotter", :phone_number => "777 777 7777", :book_id => 1, :id => nil })
      expect(patron.name()).to(eq('Harry Dotter'))
      expect(patron.phone_number()).to(eq('777 777 7777'))
    end
  end

  describe("#delete") do
    it("lets you delete a patron from the database") do
      patron = Patron.new({:name => "Schlmo Abramowitz", :phone_number => "503 888 8888", :book_id => 1, :id => nil })
      patron.save()
      patron2 = Patron.new({:name => "Tom Bodet", :phone_number => "503 666 6666", :book_id => 1, :id => nil })
      patron2.save()
      patron.delete()
      expect(Patron.all()).to(eq([patron2]))
    end
  end




end
