def user
  @user ||= Factory :user
end

def login
  user
  visit path_to("the homepage")
  page.has_content?("Log In")
  click_link "log_in_link"
  fill_in "user_session_login", :with => "john" 
  fill_in "user_session_password", :with => "funkypass"
  click_button "user_session_submit"
  page.has_content?("Logged in successfully.")
  page.has_content?("Logout")
end

def logout
  user
  visit path_to("the homepage")
  page.has_content?("Logout")
  # Fake clicking the logout link and ok confirm dialog.
  visit path_to("logout")
  page.has_content?("Logout successful.")
  page.has_content?("Logout")
end

Given /^I am a registered user$/ do
  user
end

When /^I login$/ do
  login
end

Given /^I am logged in$/ do
  login
end

When /^I logout$/ do
  logout
end

