# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cats = Cat.create([
  { birth_date: Date.parse('2016-10-31'),
    color: 'calico',
    name: Faker::Cat.name,
    sex: 'M',
    description: 'A spooky kitten.'},
  { birth_date: Date.parse('2002-01-01'),
    color: 'tuxedo',
    name: Faker::Cat.name,
    sex: 'F',
    description: 'An old, grumpy cat.'},
   ])

requests = CatRentalRequest.create([
  {
    cat_id: 1,
    start_date: Date.parse('2017-10-24'),
    end_date: Date.parse('2017-10-31')
  }
  ])
