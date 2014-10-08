# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.create(
  [
   { title: "Rails is great", body: "Yes it is!" },
   { title: "Design is all about trade-offs", body: "We say design is all about trade-offs. When's the last time you gave up something you really wanted in a design to get something else? - @rjs" },
  ]
)
