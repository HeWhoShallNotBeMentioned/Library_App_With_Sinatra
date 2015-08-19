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

get("/public") do
  erb(:public)
end

post("/public") do
  erb(:public)
end

get("/staff") do
  erb(:staff)
end

post("/staff") do
  erb(:staff)
end
