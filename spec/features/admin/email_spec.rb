require 'rails_helper'

describe "Admin can email users" do
  describe "As an admin" do
    it "I see a link on my dashboard to email a user" do
      admin = User.create!(username: "Penelope",
                          password: "boom
                          role: 1")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit '/admin/dashboard'
      expect(page).to have_link("Email a user")
    end
  end
end
