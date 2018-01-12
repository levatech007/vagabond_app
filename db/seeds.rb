# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Post.destroy_all


Post.create([	
  {
    title: "Golden Gate One day Trip",
    author: "Sam",
    content: "Beautiful Golden Gete bridge, you definately deserve to enjoy it one day!"
  },
  {
    title: "New York Finacial Trip",
    author: "Micheal",
    content: "Many professional financial experts will answer you any questions with this great trip!"
  },
  {
    title: "Winter Snow day in North California",
    author: "Josh",
    content: "The good time to explore winter snow in North California. There are many ski fans come to Tahoe every week."
  }
])