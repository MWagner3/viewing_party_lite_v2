require 'rails_helper'

RSpec.describe "Registration Page", type: :feature do
  describe "when a visitor visits /register" do
    before (:each) do
      # @user1 = User.create!(name: "Sabin Figaro", email: "sabinff6@square.com")
      # @user2 = User.create!(name: "Edgar Figaro", email: "edgarff6@square.com")
      visit '/register'
    end

    it "has a form" do

      expect(page).to have_content("Name:")
      expect(page).to have_content("Email:")
      expect(page).to have_content("Password:")
      expect(page).to have_content("Password confirmation:")
    end

    it "creates a new user" do
      # expect(User.all).to eq([@user1, @user2])


      fill_in("name", with: "Celeste Chere")
      fill_in("email", with: "celesff6@square.com")
      fill_in("password", with: "abc123")
      # save_and_open_page
      fill_in("password_confirmation", with: "abc123")
      click_on "Register"

      user3 = User.last

      expect(user3.name).to eq("Celeste Chere")
      expect(user3.email).to eq("celesff6@square.com")
    end

    it "redirects to user/dashboard" do

      fill_in("name", with: "Celeste Chere")
      fill_in("email", with: "celesff6@square.com")
      fill_in("password", with: "abc123")
      fill_in("password_confirmation", with: "abc123")
      click_on "Register"

      @user3 = User.last

      expect(current_path).to eq("/users/#{@user3.id}")
    end

    it "will stay on register page and show flash error message if incorrect info given" do

      fill_in("name", with: "Celeste Chere")
      fill_in("email", with: "celesff6@square.com")
      fill_in("password", with: "abc123")
      fill_in("password_confirmation", with: "wrong")
      click_on "Register"

      expect(current_path).to eq("/register")
      expect(page).to have_content("User Not Registered")
    end
  end
end
