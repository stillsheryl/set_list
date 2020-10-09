class Song < ApplicationRecord
  belongs_to :artist

  def self.song_count
    Song.count
  end

end
