# db/seeds.rb

# Reset des données
JourneysFear.destroy_all
Journey.destroy_all
User.destroy_all
FearsDocument.destroy_all
Fear.destroy_all
Answer.destroy_all
Question.destroy_all
Document.destroy_all
JourneysDocument.destroy_all

# Création des utilisateurs
users = User.create!([
  { first_name: 'Antoine', last_name: 'Dupont', email: 'antoine@example.com', password: 123456 },
  { first_name: 'Clara', last_name: 'Martin', email: 'clara@example.com', password: 123456 }
])

# Création des peurs
altitude = Fear.create!(name: "Peur de l'altitude")
accident = Fear.create!(name: "Peur de l'accident")
enfermement = Fear.create!(name: "Peur de l'enfermement")
panique = Fear.create!(name: "Peur de paniquer")

# Création des questions et réponses pour les documents
doc_alt_1 = altitude.documents.create!(kind: 'article', title: 'Relaxation Techniques', content: 'How to relax during a flight.', url: 'https://example.com/article1')
doc_alt_2 = altitude.documents.create!(kind: 'video', title: 'Introduction to Flying', content: 'Video content explaining flight safety.', url: 'https://youtu.be/OPf0YbXqDm0?feature=shared')


# Question associée au document doc_alt_1
question_1 = doc_alt_1.create_question!(text: 'What scares you the most about flying?')
question_1.answers.create!([
  { text: 'I feel like the plane might crash.', right: true },
  { text: 'fdsf fdsf fsd fdsfsd.', right: false },
  { text: 'cest pas la bonne réponse ou peut-être que oui.', right: false }
])

# Question associée au document doc_alt_2
question_2 = doc_alt_2.create_question!(text: 'How do you usually relax during a flight?')
question_2.answers.create!([
  { text: 'I try to focus on my breathing.', right: true },
  { text: 'fdsf fdsf fsd fdsfsd.', right: false },
  { text: 'cest pas la bonne réponse ou peut-être que oui.', right: false }
])

puts "✅ Seed data loaded successfully!"
