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

  village_manager = User.create(email: 'village_manager@example.com', password: '123456')
  village_manager.user!
end

if Village.count.zero?
  Village.create(name: 'desa rails')
end

if Family.count.zero?
  village = Village.first
  village.families.create(householder: 'pak rails')
end

if VillageManager.count.zero?
  village = Village.first
  manager = User.second

  village_manager = VillageManager.new
  village_manager.village = village
  village_manager.manager = manager
  village_manager.save
end

puts 'seed done'
