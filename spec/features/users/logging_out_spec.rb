require 'rails_helper'

RSpec.describe "Logging Out" do
  it "can log out when currently logged in" do
    user = User.create(username: "funbucket13", password: "test")

    visit "/"

    click_on "I already have an account"

    expect(current_path).to eq('/login')

    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on "Log In"

    click_on "Log out"

    expect(current_path).to eq('/login')
    expect(page).to have_link("Log In")
  end
end
