require('spec_helper')

describe(Patron) do
  describe(".all") do
    it("starts off with no patrons") do
      expect(Patron.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a patron to the table patrons") do
      test_patron = Patron.new({:name => "Schlmo Abramowitz", :phone_number => "503 888 8888", :book_id => 1 })
      test_patron.save()
      expect(Patron.all()).to(eq([test_patron]))
    end
  end

  describe("#name") do
    it("returns the patron name") do
      test_patron = Patron.new({:name => "Schlmo Abramowitz", :phone_number => "503 888 8888", :book_id => 1 })
      expect(test_patron.name()).to(eq("Schlmo Abramowitz"))
    end
  end

  describe("#phone_number") do
    it("returns the patron phone_number") do
      test_patron = Patron.new({:name => "Schlmo Abramowitz", :phone_number => "503 888 8888", :book_id => 1 })
      expect(test_patron.phone_number()).to(eq("503 888 8888"))
    end
  end

  describe("#book_id") do
    it("returns the patron book_id") do
      test_patron = Patron.new({:name => "Schlmo Abramowitz", :phone_number => "503 888 8888", :book_id => 1 })
      expect(test_patron.book_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same patron if it has the same name") do
      patron1 = Patron.new({:name => "Schlmo Abramowitz", :phone_number => "503 888 8888", :book_id => 1 })
      patron2 = Patron.new({:name => "Schlmo Abramowitz", :phone_number => "503 888 8888", :book_id => 1 })
      expect(patron1).to(eq(patron2))
    end
  end

end
