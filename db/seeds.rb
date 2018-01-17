# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



User.destroy_all
Post.destroy_all
City.destroy_all

users_data = []
4.times do
  first = FFaker::Name.first_name
  last = FFaker::Name.last_name
  users_data << {
    first_name: first,
    last_name: last,
    user_city: "San Francisco",
    email: "#{first[0]}_#{last}@example.com".downcase,
    password: "1234"
  }

end
users = User.create(users_data)

city_names = ["San Francisco", "Los Angeles", "New York", "Miami", "Chicago"]
cities_data = []
city_names.each do |city|
  cities_data << {
    name: city.downcase.gsub(" ", "-"),
    proper_name: city,
    image: "#{city.downcase.delete(' ')}_city.jpg",
    description: "Lovely city"
  }
end
cities = City.create(cities_data)

posts_data = []
8.times do
  posts_data << {
    title: "Travel review",
    content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nunc nisl, lacinia sit amet fringilla ac, posuere quis dui. Sed vel fermentum orci. Aenean a turpis quam. Ut turpis magna, lobortis a purus in, cursus tempus elit. Sed dignissim laoreet sagittis. Quisque nec ornare neque. Sed sed metus sollicitudin elit congue placerat et vel enim. In vitae arcu a purus hendrerit condimentu",
    user: users.sample,
    city: cities.sample
  }
end
Post.create(posts_data)
