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
    body: Faker::Lorem.paragraph(10),
    private: false,
    user_id: User.all.sample
  )
wiki = Wiki.all
end

10.times do
  Collaboration.create!(
    user_id: Faker::Number.between(1, 5),
    wiki_id: Faker::Number.between(1, 20)
  )
collaboration = Collaboration.all
end

puts "#{Wiki.count} wikis created!"
puts "#{User.count} users created!"
puts "#{Collaboration.count} collaborations created!"
