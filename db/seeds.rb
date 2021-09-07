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
  village.families.create(
    householder: 'pak slamet',
    rt: 1,
    rw: 2,
    number: 3,
    detail: 'pertama disini'
  )
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

if Attendance.count.zero?
  Attendance.statuses.each do |key, value|
    village = Village.first
    day_name = PatrolMember.day_in_weeks.keys.sample
    user = User.find_by(email: "user_#{day_name}@example.com")
    date = Time.now
    status = key

    Attendance.create(
      village: village,
      user: user,
      date: date,
      status: status
    )
  end
end

if Donation.count.zero?
  Donation.contents.keys.each do |content|
    village = Village.first
    family = Family.first

    donation = Donation.new
    donation.village = village
    donation.family = family
    donation.date = Time.now.to_date
    donation.content = content
    donation.money_value = 500 if content == 'money'
    donation.taken_on = Time.now
    donation.save
  end
end

puts 'seed done'
