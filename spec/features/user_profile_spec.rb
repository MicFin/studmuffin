require 'spec_helper'

feature 'user profile' do
  scenario 'can be viewed' do
    current_user = create(:user)
    offline_user = create(:user_with_allergy)
    sign_in current_user

    visit user_path(offline_user.id)

    expect(page).to have_content(offline_user.fullname)
    expect(page).to have_content(offline_user.email)
    expect(page).to have_content('soy')
  end

  scenario 'can be edited', js: true do
    sign_in create(:user)

    new_full_name = 'new user'
    new_email = 'new-email@example.com'

    within '#profile' do
      click_button 'edit'
      fill_in 'Fullname', with: new_full_name
      fill_in 'Email', with: new_email
      click_button 'save'
    end

    expect(page).to have_content new_full_name
    expect(page).to have_content new_email
  end

  scenario 'edit can be canceled', js: true do
    user = create(:user)
    sign_in user

    old_full_name = user.fullname
    new_full_name = 'new user'

    within '#profile' do
      click_button 'edit'
      fill_in 'Fullname', with: new_full_name
      click_link 'cancel'
    end

    expect(page).to have_content old_full_name
  end
end
