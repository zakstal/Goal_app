require 'rails_helper'

feature "Can create a goal" do
  it "goal should have a create page"

  it "should have username on it"

  it "should have a title"

  it "should have a description"

  it "should belong to a user"

  it "should be either public or private"
end

feature "Can list goals" do
  it "should have an index page that lists goals for a user"

  it "should have a delete button next to each goal"

  it "should only list your own goals"
end

feature "The show page for the goal" do
  it "should have a user title"

  it "should list the goal title"

  it "should show the description of the goal"

  it "should have an edit button on the page"

end

feature "Can update goals" do
  it "should have an update button on the goal edit page"
end

feature "Can delete goals" do
  it "should remove the goal from the index page"
end
