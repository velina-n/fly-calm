# db/seeds.rb

# Reset des données
puts "Resetting the database..."
JourneysDocument.destroy_all
JourneysFear.destroy_all
Journey.destroy_all
User.destroy_all
FearsDocument.destroy_all
Fear.destroy_all
Answer.destroy_all
Question.destroy_all
Document.destroy_all
puts "Database reset completed."

# Création des utilisateurs
puts "Creating users..."

users = User.create!([
  { first_name: 'Yves', last_name: 'Dupont', email: 'yves@example.com', password: "123456" },
  { first_name: 'Clara', last_name: 'Martin', email: 'clara@example.com', password: "123456" }
])
puts "Users created: #{User.count}"

# Création des peurs
fears = Fear.create!([
#   { name: 'Peur de l'attitude' }
#   peur de l'accident
#   peur de l'enfermement
#   peur de l'accident
# ])

puts "Fears created: #{Fear.count}"
# Création des voyages
journeys = Journey.create!([
  { user: users.first, status: :ongoing },
  { user: users.last, status: :completed }
])
puts "Journeys created: #{Journey.count}"

# Association des peurs aux voyages
JourneysFear.create!([
  { journey: journeys.first, fear: fears.first },
  { journey: journeys.last, fear: fears.first }
])
puts "JourneysFears created: #{JourneysFear.count}"

# Création des documents
documents = Document.create!([
  { kind: 'video', title: 'Introduction to Flying', content: 'Video content explaining flight safety.', url: 'https://example.com/video1'},
  { kind: 'article', title: 'Relaxation Techniques', content: 'How to relax during a flight.', url: 'https://example.com/article1' }
])
puts "Documents created: #{Document.count}"

# Association des documents à la peur
FearsDocument.create!([
  { fear: fears.first, document: documents[0] },
  { fear: fears.first, document: documents[1] }
])
puts "FearsDocuments created: #{FearsDocument.count}"

# Association des documents aux voyages
JourneysDocument.create!([
  { journey: journeys.first, document: documents[0], position: 1, status: :pending },
  { journey: journeys.first, document: documents[1], position: 2, status: :pending }
])
puts  "JourneysDocuments created: #{JourneysDocument.count}"

# Création des questions
questions = Question.create!([
  { text: 'What scares you the most about flying?', document: documents[0] },
  { text: 'How do you usually relax during a flight?', document: documents[1] }
])
puts "Questions created: #{Question.count}"

# Création des réponses
Answer.create!([
  { text: 'I feel like the plane might crash.', question: questions.first },
  { text: 'I try to focus on my breathing.', question: questions.last }
])
puts "Answers created: #{Answer.count}"
