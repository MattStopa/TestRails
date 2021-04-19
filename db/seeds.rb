# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Fix missing links
file = File.open("db/fact_seed_data.json").read
fact_json = JSON.parse(file)

puts "IMPORTING Facts"
fact_json.each do |fact|

  f = Fact.where(headline: fact['headline']).first

  f.links = fact['links'] ? fact['links'].join("\n") : ''
  puts f.links
  f.save
end




