5.times do
  User.create!(
  email: Faker::Internet.email,
  password: "helloworld",
  )
user = User.all
end

20.times do
  Wiki.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph(3),
    private: false,
    user: User.all.sample
  )
wiki = Wiki.all
end

puts "#{Wiki.count} wikis created!"
puts "#{User.count} users created!"
