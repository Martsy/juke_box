class Song < ApplicationRecord
  belongs_to :artist

  validates_presence_of :title

  def self.song_count
    count
  end
end
