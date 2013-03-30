Given /^a user visits the signin page$/ do
  visit signin_path
end

When /^the user submits invalid signin information$/ do
  click_button 'Sign In'
end

Then /^the user should see an error message$/ do
  page.should have_error_message 'Invalid'
end

Given /^the user has an account$/ do
  @user = User.create(name: 'User Name', email: 'user@email.com',
                      password: 'password', password_confirmation: 'password')
end

When /^the user submits valid signin information$/ do
  sign_in @user
end

Then /^the user should see their profile page$/ do
  page.should have_selector('title', text: @user.name)
end

Then /^the user should see a signout link$/ do
  page.should have_link('Sign Out', href: signout_path)
end