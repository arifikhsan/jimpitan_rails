# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'seed started'

if User.count.zero?
  user = User.new(email: 'admin@example.com', password: '123456')
  user.build_user_detail(name: 'admin')
  user.save
  user.admin!

  village_manager = User.new(email: 'village_manager@example.com', password: '123456')
  village_manager.build_user_detail(name: 'village_manager')
  village_manager.save
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

if PatrolMember.count.zero?
  7.times do |day|
    day_name = PatrolMember.day_in_weeks.key(day)
    user = User.new(email: "user_#{day_name}@example.com", password: '123456')
    user.build_user_detail(name: "user_#{day_name}")
    user.save

    village = Village.first

    pm = PatrolMember.new
    pm.village = village
    pm.user = user
    pm.day_in_week = day
    pm.save
  end
end

puts 'seed done'
