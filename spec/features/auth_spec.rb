require 'rails_helper'

feature "the signup process" do
  it "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign Up"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'username', :with => "testing_username"
      fill_in 'password', :with => "biscuits"
      click_on "Sign Up"
    end

    it "shows username on the homepage after signup" do


      expect(page).to have_content "testing_username"
    end
  end
end

feature "logging in" do
  before(:each) do
    visit new_session_url
    fill_in 'username', :with => "testing_username"
    fill_in 'password', :with => "biscuits"
    click_on "Log In"
  end

  it "shows username on the homepage after login" do

    expect(page).to have_content "testing_username"
  end
end

feature "logging out" do

  before(:each) do
    visit new_session_url
    fill_in 'username', :with => "testing_username"
    fill_in 'password', :with => "biscuits"
    click_on "Log In"
  end

  it "has a log out button if logged in" do
    click_on "Log Out"
  end

  it "begins with logged out state" do

    visit new_session_url
    expect(page).to have_content "Log In"
  end

  it "doesn't show username on the homepage after logout" do
    click_on "Log Out"
    expect(page).not_to have_content("testing_username")
  end
end