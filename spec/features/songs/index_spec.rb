require "rails_helper"

describe "As a user" do
  describe "when I visit the /songs path" do
    it "the user sees each song title and play count" do
      song_1 = Song.create(title:       "I Really Like You",
                           length:      208,
                           play_count:  243810867)
      song_2 = Song.create(title:       "Call Me Maybe",
                           length:      199,
                           play_count:  1214722172)

      visit '/songs'
      expect(page).to have_content("Song List")
      expect(page).to have_content("#{song_1.title}")
      expect(page).to have_content("#{song_2.title}")
      expect(page).to have_content("Play Count: #{song_1.play_count}")
      expect(page).to have_content("Play Count: #{song_2.play_count}")
    end
  end
end
