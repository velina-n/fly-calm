# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Reset des données
User.destroy_all
Journey.destroy_all
Fear.destroy_all
Document.destroy_all
Question.destroy_all
Answer.destroy_all
JourneysFear.destroy_all
FearsDocument.destroy_all
JourneysDocument.destroy_all

# Création des utilisateurs
users = User.create!([
  { first_name: 'Antoine', last_name: 'Dupont', email: 'antoine@example.com' },
  { first_name: 'Clara', last_name: 'Martin', email: 'clara@example.com' }
])

# Création des peurs
fears = Fear.create!([
  { name: 'Fear of Flying' }
])

# Création des voyages
journeys = Journey.create!([
  { user: users.first, status: 'in_progress' },
  { user: users.last, status: 'completed' }
])

# Association des peurs aux voyages
JourneysFear.create!([
  { journey: journeys.first, fear: fears.first },
  { journey: journeys.last, fear: fears.first }
])

# Création des documents
documents = Document.create!([
  { kind: 'video', title: 'Introduction to Flying', content: 'Video content explaining flight safety.', url: 'https://example.com/video1', category: 'education' },
  { kind: 'article', title: 'Relaxation Techniques', content: 'How to relax during a flight.', url: 'https://example.com/article1', category: 'tips' }
])

# Association des documents à la peur
FearsDocument.create!([
  { fear: fears.first, document: documents[0] },
  { fear: fears.first, document: documents[1] }
])

# Association des documents aux voyages
JourneysDocument.create!([
  { journey: journeys.first, document: documents[0], position: 1, status: 'not_started' },
  { journey: journeys.first, document: documents[1], position: 2, status: 'completed' }
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

puts "Seed data successfully created!"
