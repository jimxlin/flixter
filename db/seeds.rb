###To Do: add videos to lessons

# *Important* seeding will add images to whatever cloud storage you are
#   using.
#  It is recommended to delete these images before a re-seed.

# Clear DB entries
User.delete_all
Course.delete_all
Section.delete_all
Lesson.delete_all

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

IMG_PATHS = {
  img1: "db/seed_data/gem1.jpg",
  img2: "db/seed_data/gem2.jpg",
  img3: "db/seed_data/java1.jpg",
  img4: "db/seed_data/java2.jpg",
  img5: "db/seed_data/java3.jpg",
  img6: "db/seed_data/rails1.jpg",
  img7: "db/seed_data/rails2.jpg",
  img8: "db/seed_data/rails3.jpg",
}

8.times do |n|
  title = "#{Faker::Hacker.ingverb} #{Faker::Hacker.noun}".upcase!
  description = "#{Faker::Hacker.say_something_smart}"
  cost = rand(0..50)
  img_path = IMG_PATHS[IMG_PATHS.keys.sample]
  user_id = user_ids.sample

  Course.create!(
    title: title,
    description: description,
    cost: cost,
    image: Rails.root.join(img_path).open,
    user_id: user_id
  )
end

course_ids = []
Course.find_each { |course| course_ids << course.id }

############################# Sections #################################

Course.all.each do |course|
  (1..rand(2..7)).each do |n|
    title = "Section #{n}"
    course_id = course.id
    Section.create!(
      title: title,
      course_id:  course_id
    )
  end
end

############################# Lessons ##################################

Section.all.each do |section|
  (1..rand(2..4)).each do |n|
    title = "Lesson #{n}"
    subtitle = "#{Faker::Hacker.ingverb} #{Faker::Hacker.adjective} #{Faker::Hacker.noun}".upcase!
    section_id = section.id
    Lesson.create!(
      title: title,
      subtitle: subtitle,
      section_id: section_id
    )
  end
end
