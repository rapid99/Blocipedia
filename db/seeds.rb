20.times do
  Wiki.create!(
    title: Faker::Beer.unique.name,
    body: Faker::Hacker.say_something_smart,
    private: true,
  )
wiki = Wiki.all

puts "#{Wiki.count} wikis created!"
end
