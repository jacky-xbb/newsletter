10.times do
  Email.create(
    subject: Faker::Lorem.sentence(word_count: 5),
    body: Faker::Lorem.paragraph(sentence_count: 20)
  )
end
