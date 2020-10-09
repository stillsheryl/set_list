class Artist < ApplicationRecord
  has_many :songs

  validates_presence_of :name

  def average_song_length
    total = self.songs.sum do |song|
      song.length
    end
    total/self.songs.count
  end
end
