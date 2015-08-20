require('spec_helper')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exception, false)

describe('seeing all books and showing them on Sinatra', {:type => :feature}) do
  it('allows a user to seeclick a list to see the tasks and details for it') do
    test_book = Book.new({:title => "Harry Potter", :author => "JK Rowling", :id => nil})
    test_book.save()
    visit('/staff')
    click_link(test_book.title())
    expect(page).to have_content(test_book.title(), test_book.author())
  end
end
