require 'rails_helper'

RSpec.describe 'login page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Candy', email: 'candy@gmail.com',
                        password: '123456', created_at: Time.now, updated_at: Time.now)
    @user.confirm
    visit user_session_path
  end

  context 'should render login page elements' do
    it 'should render email field' do
      expect(page).to have_field(type: 'email')
    end
    it 'should render password field' do
      expect(page).to have_field(type: 'password')
    end
    it 'should render email field' do
      expect(page).to have_button(type: 'submit')
    end
  end

  context 'testing log in' do
    it 'should return error on logging in with empty fields' do
      visit new_user_session_path
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end

    it 'should return error on logging in with wrong entries' do
      visit new_user_session_path
      fill_in 'Email', with: 'example@gmail.com'
      fill_in 'Password', with: 'example'
      click_button 'Log in'
      expect(page).to have_content 'Invalid Email or password.'
    end

    it 'should redirect to users page after logging in with right entries' do
      visit new_user_session_path
      fill_in 'Email', with: 'candy@gmail.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      expect(page).to have_http_status :ok
      expect(page).to have_content 'Signed in successfully'
    end
  end

  context 'Testing splash page content text' do
    it 'I can see the title of the page and the sign in link.' do
      visit root_path
      expect(page).to have_content 'LOG IN'
    end

    it 'I can not access this pages if user is connected' do
      visit new_user_session_path
      fill_in 'user_email',	with: 'candy@gmail.com'
      fill_in 'user_password',	with: '123456'
      click_button 'Log in'

      expect(page).to have_content 'CATEGORIES'
    end
  end
end
