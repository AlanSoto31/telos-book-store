# rubocop:disable Metrics/BlockLength
require 'rails_helper'
RSpec.feature 'Users', type: :feature do
  before(:each) do
    visit new_user_path
    within('form') do
      fill_in 'Name', with: 'alan'
      fill_in 'Address', with: 'acambaro'
      fill_in 'Password', with: '123456'
      fill_in 'Password confirmation', with: '123456'
    end
  end
  context 'Create new user' do
    scenario 'should be successful' do
      within('form') do
        fill_in 'Email', with: 'alana@alana'
      end
      click_button 'Create'
      expect(page).to have_content('Successfully created account')
    end

    scenario 'should fail' do
      click_button 'Create'
      expect(page).to have_content('Email can\'t be blank')
    end
  end

  context 'Update user' do
    let!(:user) do
      User.create(name: 'hana', email: 'hana@hana', address: 'acambaro', password: '123456',
                  password_confirmation: '123456')
    end
    before(:each) do
      visit edit_user_path(user)
    end

    scenario 'should be successful' do
      within('form') do
        fill_in 'Phone', with: '123456'
      end
      click_button 'Update'
      expect(page).to have_content('User was successfully updated')
    end
  end
end
# rubocop:enable Metrics/BlockLength
