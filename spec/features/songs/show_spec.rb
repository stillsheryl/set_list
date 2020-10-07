require "rails_helper"

describe "As a user" do
  describe  "when I visit a Song show page" do
    it "the user sees the song's title, length, and play count" do
      song_1 = Song.create(title:       "Blackbird",
                           length:      243,
                           play_count:  453254)

      visit "/songs/#{song_1.id}"
      save_and_open_page # use locally for testing and then remove
      expect(page).to have_content("#{song_1.title}")
      expect(page).to have_content("Length: #{song_1.length}")
      expect(page).to have_content("Play Count: #{song_1.play_count}")
    end

    it "the user sees a link back to the songs index page" do
      song_1 = Song.create(title:       "Blackbird",
                           length:      243,
                           play_count:  453254)

      visit "/songs/#{song_1.id}"
      expect(page).to have_link("Back to Songs")
    end

  end
end
