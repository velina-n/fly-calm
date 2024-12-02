# app services seed seed_answers.rb
require "csv"

class Seed::SeedAnswers
  def initialize()
    @file_path = Rails.root.join('db', 'answers.csv')
  end

  def call
    CSV.foreach(@file_path, headers: true) do |row|
      article = Document.find_by(slug: row['article_slug'].strip)
      question = article.question

      Answer.create!(
        question: question,
        text: row['text_answer'],
        right: row['right'].downcase == 'true'
      )
    end
  end
end
