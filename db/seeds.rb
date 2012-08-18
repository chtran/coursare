# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
thrun = Instructor.create! name: "Sebastian Thrun", school: "Stanford"
cs = Subject.create! title: "Computer Science"
ai = thrun.courses.create! title: "Introduction to Artificial Intelligence", start_date: Time.now, length: 90, subject_id: cs.id, image: "https://s3.amazonaws.com/coursera/topics/comparch/small-icon.hover.png"
welcome = ai.lessons.create! title: "Welcome to AI"
intro = welcome.videos.create! url: "BnIJ7Ba5Sr4", title: "Introduction"
overview = welcome.videos.create! url: "Q7_GQq7cDyM", title: "Overview"
q1 = overview.quizzes.create! prompt: "A AI Program is called"
q1.quiz_choices.create! choice_letter: "A", content: "Wetware", correct: false
q1.quiz_choices.create! choice_letter: "B", content: "Formula", correct: false
q1.quiz_choices.create! choice_letter: "C", content: "Intelligent Agent", correct: true
agent = welcome.videos.create! url: "cx3lV07w-XE", title: "Intelligent Agents"
q2 = agent.quizzes.create! prompt: "AI has successfully been used in"
q2.quiz_choices.create! choice_letter: "A", content: "Finance", correct: false
q2.quiz_choices.create! choice_letter: "B", content: "Robotics", correct: false
q2.quiz_choices.create! choice_letter: "C", content: "Games", correct: false
q2.quiz_choices.create! choice_letter: "D", content: "All of them", correct: true
app = welcome.videos.create! url: "N6JW8TQzbX8", title: "Applications of AI"

ps = ai.lessons.create! title: "Problem Solving"
ps.videos.create! url: "ZQmJuHtpGfs", title: "Introduction"
ps.videos.create! url: "SIHc9LgMeaU", title: "What is a problem?"
ps.videos.create! url: "bEi73QXP7PA", title: "Route finding problem"

probability = ai.lessons.create! title: "Probability in AI"
probability.videos.create! url: "-8DyY8_IuA0", title: "Introduction"
coin = probability.videos.create! url: "EdONkI3RNKg", title: "Coin flipping"
