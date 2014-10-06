RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
   expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

end

def sign_in
  visit new_user_url
  fill_in 'username', :with => "testing_username"
  fill_in 'password', :with => "biscuits"
  click_on "Sign Up"
end

def create_goal
  sign_in
  visit new_user_goal_url
  fill_in 'title', :with => "New Goal"
  fill_in 'description', :with => "Best goal ever"
  choose 'Private'
  click_on "Create Goal"
end