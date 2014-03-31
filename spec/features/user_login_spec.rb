require 'spec_helper'

feature 'User login' do
  scenario 'with valid email and password is successful' do
    user = create(:user)
    visit new_user_session_path

    within '.new_user' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Sign in'
    end

    expect(current_path).to eq root_path
  end

  scenario 'with invalid email is unsuccessful' do
    user = create(:user)
    visit new_user_session_path

    within '.new_user' do
      fill_in 'Email', with: 'invalidemail'
      fill_in 'Password', with: user.password
      click_on 'Sign in'
    end

    expect(current_path).to eq new_user_session_path
    expect(page).to have_content 'Invalid email or password'
  end

  scenario 'user can logout once logged into the application', js: true do
    user = create(:user)
    sign_in user

    click_button 'Logout'

    expect(current_path).to eq new_user_session_path
    expect(page).to have_content 'Sign in'
  end

  scenario 'user who is not logged in is redirected to login screen' do
    visit root_path

    expect(current_path).to eq new_user_session_path
    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end
end
