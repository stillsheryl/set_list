require 'rails_helper'

RSpec.describe "the Playlist index page" do
  it "should display all playlists" do
    rock = Playlist.create!(name: "Classic Rock")
    uplifting_sound = Playlist.create!(name: "Uplifting Sound")
    jams = Playlist.create!(name: "Favorite Jams")

    talking_heads = Artist.create!(name: "Talking Heads")
    jgb = Artist.create!(name: "Jerry Garcia Band")
    zac_brown = Artist.create!(name: "Zac Brown Band")

    place = talking_heads.songs.create!(title: "This Must Be The Place", length: 832, play_count: 83209)
    breadbox = jgb.songs.create!(title: "Aint No Bread in the Breadbox", length: 832, play_count: 83209)
    r_and_c = jgb.songs.create!(title: "Reuben and Cherise", length: 832, play_count: 83209)
    chicken = zac_brown.songs.create!(title: "Chicken Fried", length: 4378, play_count: 7453689)

    PlaylistSong.create!(song: chicken, playlist: uplifting_sound)
    PlaylistSong.create!(song: chicken, playlist: jams)
    PlaylistSong.create!(song: place, playlist: jams)
    PlaylistSong.create!(song: place, playlist: rock)
    PlaylistSong.create!(song: breadbox, playlist: rock)
    PlaylistSong.create!(song: r_and_c, playlist: rock)

    visit '/playlists'

    within("#playlist-#{rock.id}") do
      expect(page).to have_content(rock.name)
      expect(page).to have_content(place.title)
      expect(page).to have_content(breadbox.title)
      expect(page).to have_content(r_and_c.title)
    end

    within("#playlist-#{uplifting_sound.id}") do
      expect(page).to have_content(uplifting_sound.name)
      expect(page).to have_content(chicken.title)
    end

    within("#playlist-#{jams.id}") do
      expect(page).to have_content(jams.name)
      expect(page).to have_content(chicken.title)
      expect(page).to have_content(place.title)
    end
  end
end
