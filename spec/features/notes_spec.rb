require 'spec_helper'

feature 'notes', js: true do
  before do
    @user = create(:user)
    @note = create(:note, user: @user)
    sign_in @user
  end

  scenario 'can be viewed' do
    within '#notes' do
      click_link @note.name
    end

    expect(current_path).to eq user_note_path(@user, @note)
    expect(page).to have_content @note.name
    expect(page).to have_content @note.content
  end

  scenario 'can be created' do
    note_name = 'Note Name'
    note_content = 'Note content.'

    within '#notes' do
      click_button 'new'
      fill_in 'Name', with: note_name
      fill_in 'Content', with: note_content
      click_button 'save'
    end

    expect(page).to have_content note_name
    expect(page).to have_content note_content
  end

  scenario 'creation can be canceled' do
    note_name = 'Note Name'
    note_content = 'Note content.'

    within '#notes' do
      click_button 'new'
      fill_in 'Name', with: note_name
      fill_in 'Content', with: note_content
      click_link 'cancel'
    end

    expect(page).not_to have_content note_name
    expect(page).not_to have_content note_content
  end

  scenario 'can be edited' do
    visit user_note_path(@user, @note)
    click_button 'Edit'

    new_note_name = 'New name'
    new_note_content = 'New content'

    fill_in 'Name', with: new_note_name
    fill_in 'Content', with: new_note_content
    click_button 'Save'

    expect(page).to have_content new_note_name
    expect(page).to have_content new_note_content
  end

  scenario 'can be deleted' do
    visit user_note_path(@user, @note)
    click_button 'Delete'

    expect(current_path).to eq root_path
    expect(page).not_to have_content @note.name
  end
end
