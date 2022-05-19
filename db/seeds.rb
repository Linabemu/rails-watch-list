# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'open-uri'
require 'json'

Movie.destroy_all

url = 'https://tmdb.lewagon.com/movie/top_rated?api_key=%3Cyour_api_key%3E'

serialized_movies = URI.open(url).read
movies = JSON.parse(serialized_movies) # -> hash d'array de hash/movie

movies["results"].first(20).each do |movie|
  puts "Creating Movie"
  Movie.create!(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie["poster_path"]}",
    rating: rand(0..5)
  )
  puts "Movie created"
end

# dans terminal=> rails db:seed pour charger les movies dans le projet
# dans terminal=> rails c  pour executer les commandes de rails
# Movie.count / Movie.all
