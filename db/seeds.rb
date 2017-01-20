20.times do
  Wiki.create!(
    title: Faker::Beer.unique.name,
    body: Faker::Lorem.paragraphs(3),
    private: true,
  )
wiki = Wiki.all

puts "#{Wiki.count} wikis created!"
end
