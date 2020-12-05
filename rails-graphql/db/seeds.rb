10.times do
  user = User.create(username: Faker::JapaneseMedia::DragonBall.character, email: Faker::Internet.email)
  post = Post.create(user: user, subject: Faker::Lorem.sentence, body: Faker::Quote.matz)
  Comment.create(user: user, post: post, body: Faker::Quote.matz)
end
