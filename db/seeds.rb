# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'seed started'

if User.count.zero?
  user = User.create(email: 'admin@example.com', password: '123456')
  user.admin!
end

if Village.count.zero?
  Village.create(name: 'desa rails')
end

if Family.count.zero?
  village = Village.first
  village.families.create(householder: 'pak rails')
end

puts 'seed done'
