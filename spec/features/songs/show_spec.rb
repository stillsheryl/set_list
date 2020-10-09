require "rails_helper"

describe "as a visitor" do
  describe "I visit a song show page" do
    it "then I only see that song's title and artist" do
      talking_heads = Artist.create!(name: 'Talking Heads')
      she_was = talking_heads.songs.create!(title: 'And She Was', length: 234, play_count: 34)
      wild_life = talking_heads.songs.create!(title: 'Wild Wild Life', length: 456, play_count: 45)

      visit "/songs/#{she_was.id}"

      expect(page).to have_content(she_was.title)
      expect(page).to have_content("By: #{talking_heads.name}")
      expect(page).to_not have_content(wild_life.title)
    end
  end
end

# describe "As a user" do
#   describe  "when I visit a Song show page" do
#     it "then I see the song's title, length, and play count" do
#       song_1 = Song.create(title:       "Blackbird",
#                            length:      243,
#                            play_count:  453254)
#
#       visit "/songs/#{song_1.id}"
#
#       expect(page).to have_content("#{song_1.title}")
#       expect(page).to have_content("Length: #{song_1.length}")
#       expect(page).to have_content("Play Count: #{song_1.play_count}")
#     end
#
#     it "the user sees a link back to the songs index page" do
#       song_1 = Song.create(title:       "Blackbird",
#                            length:      243,
#                            play_count:  453254)
#
#       visit "/songs/#{song_1.id}"
#       expect(page).to have_link("Back to Songs")
#     end
#   end
# end
