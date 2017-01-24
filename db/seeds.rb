# Clear DB entries
User.delete_all
Course.delete_all

############################# Users ####################################

16.times do |n|
  User.create!(
    email:    "foobar-#{n}@foobar.com",
    password: "foobar"
  )
end

user_ids = []
User.find_each { |user| user_ids << user.id }

############################# Courses ##################################

8.times do |n|
  title = "#{Faker::Hacker.ingverb} #{Faker::Hacker.adjective} #{Faker::Hacker.noun}".upcase!
  description = "#{Faker::Hacker.say_something_smart}"
  cost = rand(0..50)
  user_id = user_ids.sample
  Course.create!(
    title: title,
    description: description,
    cost: cost,
    user_id: user_id
  )
end

course_ids = []
Course.find_each { |course| course_ids << course.id }
