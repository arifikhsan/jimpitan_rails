# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'seed started'

if Role.count.zero?
  %w[admin manager member guest].each do |name|
    Role.create(name: name)
  end
end

if User.count.zero?
  user = User.new(email: 'admin@example.com', password: '123456')
  user.build_user_detail(name: 'admin')
  user.role = Role.admin
  user.save

  village_manager = User.new(email: 'village_manager@example.com', password: '123456')
  village_manager.build_user_detail(name: 'village_manager')
  village_manager.role = Role.manager
  village_manager.save
end

if Village.count.zero?
  Village.create(name: 'desa rails')
end

if Family.count.zero?
  5.times do |index|
    village = Village.first
    village.families.create(
      householder: "pak slamet #{index + 1}",
      rt: 1 + index,
      rw: 2 + 1 + index,
      number: 3 + index,
      detail: "penghuni ke-#{index + 1} di desa ini"
    )
  end
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

if VillageDonation.count.zero?
  VillageDonation.contents.keys.each do |key, _|
    village = Village.first
    content = key
    if key == 'empty'
      title = 'Kosong'
      value = 0
    elsif key == 'money'
      title = 'Uang 500'
      value = 500
    elsif key == 'rice'
      title = 'Beras'
      value = 1
    else
      title = 'Lainnya'
      value = 1
    end

    VillageDonation.create(
      village: village,
      title: title,
      value: value,
      content: content
    )
  end
end

if Donation.count.zero?
  3.times do
    Donation.create(
      village: Village.first,
      family: Family.first,
      patrol_member: PatrolMember.first,
      village_donation: VillageDonation.all.sample,
      date: Time.now.to_date,
      taken_at: Time.now
    )
  end
end

puts 'seed done'
