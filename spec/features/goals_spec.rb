require 'rails_helper'

feature "Can create a goal" do

  before(:each) do
    visit new_user_url
    fill_in 'username', :with => "testing_username"
    fill_in 'password', :with => "biscuits"
    click_on "Sign Up"
    visit new_user_goal_url
  end

  it "goal should have a create page" do
    expect(page).to have_content("Create Goal")
  end

  it "should have username on it" do
    expect(page).to have_content("testing_username")
  end

  it "should have a title" do
    expect(page).to have_content("Title")
  end

  it "should have a description" do
    expect(page).to have_content("Description")
  end

  it "should be either public or private" do
    expect(page).to have_content("Public")
    expect(page).to have_content("Private")
  end
end

feature "Can list goals" do

  before(:each) do
    sign_in
  end
  it "should have an index page that lists goals for a user" do
    expect(page).to have_content("All Goals")
  end

  it "should have a delete button next to each goal" do
    create_goal
    visit user_goals_url
    expect(page).to have_content("New Goal")
    click_on "Delete"
    expect(page).not_to have_content("New Goal")
  end

end

feature "The show page for the goal" do
  before(:each) do
    create_goal
  end

  it "should have a user title" do
    expect(page).to have_content("testing_username")
  end

  it "should have goal title" do
    expect(page).to have_content("New Goal")
  end

  it "should show the description of the goal" do
    expect(page).to have_content("Best goal ever")
  end

  it "should have an edit button on the page" do

    click_on "Edit this Goal"
    expect(page).to have_content("Edit Goal")
  end

end

feature "Can update goals" do
  before(:each) do
    create_goal
  end

  it "should have an update button on the goal edit page" do
   click_on "Edit this Goal"
    expect(page).to have_content("Best goal ever")
    fill_in "description", :with => "Best goal ever1"
    click_on "Update Goal"
    expect(page).to have_content("Best goal ever1")
  end
end

feature "Can delete goals" do
  it "should remove the goal from the index page" do
    create_goal
    visit user_goals_url
    expect(page).to have_content("New Goal")

    click_on "Delete"
    expect(page).not_to have_content("New Goal")
  end
end
