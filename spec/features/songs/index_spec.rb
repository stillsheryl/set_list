require "rails_helper"

describe "As a user" do
  describe "when I visit the /songs path" do
    it "the user sees each song title and play count" do
      artist_1 = Artist.create!(name: "Carly")
      song_1 = artist_1.songs.create!(title:       "I Really Like You",
                           length:      208,
                           play_count:  243810867)
      song_2 = artist_1.songs.create!(title:       "Call Me Maybe",
                           length:      199,
                           play_count:  1214722172)

      visit '/songs'

      within("#header-song") do
        expect(page).to have_content("Song List")
      end

      # within '.songs' do
      #   expect(page.all(li)[0]).to have_content("#{song_1.title}")
      #   expect(page.all(li)[1]).to have_content("#{song_2.title}")
      # end

      within "#song-#{song_1.id}" do
        expect(page).to have_content("#{song_1.title}")
        expect(page).to have_content("Play Count: #{song_1.play_count}")
      end

      within all('.songs')[0] do
        expect(page).to have_content("#{song_1.title}")
      end

      within all('.songs')[1] do
        expect(page).to have_content("#{song_2.title}")
        expect(page).to have_content("Play Count: #{song_2.play_count}")
      end
    end
  end
end
