# app services seed seed_videos.rb
require "csv"

class Seed::SeedVideos
  def initialize()
    @file_path = Rails.root.join('db', 'videos.csv')
  end

  def call
    Document.video.destroy_all

    CSV.foreach(@file_path, headers: true) do |row|
      fears = Fear.where(slug: row['fear_slug']&.split(',')&.map(&:strip))

      doc = Document.create!(
        slug: row['video_slug'],
        title: row['title'],
        video_url: row['video_url'],
        tags: row['tags']&.split(',')&.map(&:strip),
        kind: 'video'
      )

      question = Question.create!(
        text: row['question'],
        document: doc
      )

      doc.fears = fears
    end
  end
end
