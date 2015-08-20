require("sinatra")
require("sinatra/reloader")
require("./lib/patron")
require("./lib/book")
also_reload("lib/**/*.rb")
require('pg')


DB = PG.connect({:dbname => "library_test"})

get("/") do
  erb(:index)
end

# get("/public") do
#   erb(:public)
# end
#
# post("/public") do
#   erb(:public)
# end

get("/staff") do
  @books = Book.all()
  erb(:staff)
end

get("/staff/book/:id") do
  @book = Book.find(params.fetch("id").to_i())
  erb(:book)
end

post("/staff") do
  title = params.fetch("title")
  author = params.fetch("author")
  @books = Book.new({:title => title, :author=> author, :id => nil})
  @books.save()
  redirect('/staff')
end

patch('/staff/book/:id') do
  title = params.fetch("title")
  author = params.fetch("author")
  @book = Book.find(params.fetch('id').to_i)
  @book.update({:title => title, :author=> author})
  redirect("/staff")
end

delete('/staff/book/:id') do
  @book = Book.find(params.fetch('id').to_i)
  @book.delete()
  @books = Book.all()
  erb(:success)
end
