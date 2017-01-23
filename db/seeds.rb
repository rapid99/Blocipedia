20.times do
  Wiki.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph(3),
    private: false,
  )
wiki = Wiki.all
end

5.times do
  User.create!(
  email: Faker::Internet.email,
  password: "helloworld",
  )
user = User.all
end

puts "#{Wiki.count} wikis created!"
puts "#{User.count} users created!"
