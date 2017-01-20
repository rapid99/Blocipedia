20.times do
  Wiki.create!(
    title: Faker::Beer.unique.name,
    body: Faker::Lorem.paragraphs(3),
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
