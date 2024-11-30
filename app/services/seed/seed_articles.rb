# app services seed seed_articles.rb
require "csv"

class Seed::SeedArticles
  def initialize()
    @file_path = Rails.root.join('db', 'articles.csv')
  end

  def call
    Document.article.destroy_all

    CSV.foreach(@file_path, headers: true) do |row|
      fears = Fear.where(slug: row['fear_slug']&.split(',')&.map(&:strip))

      doc = Document.create!(
        slug: row['slug'],
        title: row['title'],
        intro: row['intro'],
        conclusion: row['conclusion'],
        image_url:  row['image_url'],
        tags: row['tags']&.split(',')&.map(&:strip),
        kind: 'article'
      )

      question = Question.create!(
        text: row['question'],
        document: doc
      )

      doc.fears = fears
    end
  end
end
