require 'rails_helper'

describe "When I visit '/artists'" do
  it "I see a list of all artist names" do
    talking_heads = Artist.create!(name: 'Talking Heads')
    prince = Artist.create!(name: 'Prince')

    visit '/artists'

    expect(page).to have_content("Prince")
    expect(page).to have_content("Talking Heads")
  end
end
