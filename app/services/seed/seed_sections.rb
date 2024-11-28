require "csv"

class Seed::SeedSections
  def initialize()
    @file_path = Rails.root.join('db', 'sections.csv')
  end

  def call
    CSV.foreach(@file_path, headers: true) do |row|
      article = Document.find_by(slug: row['article_slug'].strip)

      Section.create!(
        document: article,
        content: row['content'],
        title: row['title']
      )
    end
  end
end