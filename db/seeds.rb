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
fears = Fear.create!([
  { name: 'Fear of Flying' }
])

# Création des voyages
journeys = Journey.create!([
  { user: users.first, status: :ongoing },
  { user: users.last, status: :completed }
])

# Association des peurs aux voyages
JourneysFear.create!([
  { journey: journeys.first, fear: fears.first },
  { journey: journeys.last, fear: fears.first }
])

# Création des documents
documents = Document.create!([
  { kind: 'video', title: 'Introduction to Flying', content: 'Video content explaining flight safety.', url: 'https://example.com/video1'},
  { kind: 'article', title: 'Relaxation Techniques', content: 'How to relax during a flight.', url: 'https://example.com/article1' }
])

# Association des documents à la peur
FearsDocument.create!([
  { fear: fears.first, document: documents[0] },
  { fear: fears.first, document: documents[1] }
])

# Association des documents aux voyages
JourneysDocument.create!([
  { journey: journeys.first, document: documents[0], position: 1, status: :pending },
  { journey: journeys.first, document: documents[1], position: 2, status: :pending }
])

# Création des questions
questions = Question.create!([
  { text: 'What scares you the most about flying?', document: documents[0] },
  { text: 'How do you usually relax during a flight?', document: documents[1] }
])

# Création des réponses
Answer.create!([
  { text: 'I feel like the plane might crash.', question: questions.first },
  { text: 'I try to focus on my breathing.', question: questions.last }
])
