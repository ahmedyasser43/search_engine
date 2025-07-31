# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

SearchSuggestion.create!([
  { term: "rails", count: 15 },
  { term: "search engine", count: 12 },
  { term: "postgresql", count: 10 },
  { term: "nokogiri", count: 8 },
  { term: "ruby on rails tutorial", count: 8 },
  { term: "ruby on rails beginner", count: 10 },
  { term: "beginner ruby on rails guide", count: 13 }
])

