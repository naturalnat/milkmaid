# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Milk.create!(:milktype=>'2% Whole Milk')
Milk.create!(:milktype=>'Skim Milk')
Milk.create!(:milktype=>'Goat Milk')
Milk.create!(:milktype=>'Almond Milk')
