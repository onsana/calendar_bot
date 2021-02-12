# Event.destroy_all

150.times do
  Event.create!(
      started_at: Faker::Date.between(from: 200.year.ago, to: '2021-02-25'),
      title: Faker::Quotes::Shakespeare.hamlet_quote,
      content: "Anniversary of the death of a famous or not so famous dude named #{Faker::TvShows::GameOfThrones.character}, who died that day #{rand(200)} years ago.",
  )
end
