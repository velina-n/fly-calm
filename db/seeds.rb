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



doc_alt_1 = altitude.documents.create!(kind: 'article', title: 'Relaxation Techniques', content: 'How to relax during a flight.', url: 'https://example.com/article1')
doc_alt_2 = altitude.documents.create!(kind: 'video', title: 'Introduction to Flying', content: 'Video content explaining flight safety.', url: 'https://example.com/video1')


question = Question.create!(text: 'What scares you the most about flying?', document: doc_alt_1)
question.answers.create!(text: 'I feel like the plane might crash.', right: true)
question.answers.create!(text: 'fdsf fdsf fsd fdsfsd.')
question.answers.create!(text: 'cest pas la bonne réponse ou peut-être que oui.')


question = Question.create!(text: 'How do you usually relax during a flight?', document: doc_alt_2)
question.answers.create!(text: 'I try to focus on my breathing.', right: true)
question.answers.create!(text: 'fdsf fdsf fsd fdsfsd.')
question.answers.create!(text: 'cest pas la bonne réponse ou peut-être que oui.')
