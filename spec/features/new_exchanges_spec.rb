require 'rails_helper'

RSpec.describe 'new transaction page', type: :feature do
  before(:each) do
    @candy = User.create(name: 'Candy', email: 'candy@gmail.com',
                         password: '123456', created_at: Time.now, updated_at: Time.now)
    @candy.confirm

    @cat1 = Category.create(name: 'Category_1', icon: 'https://static.thenounproject.com/png/407799-200.png',
                            user: @candy)
  end

  after(:each) do
    User.destroy_all
  end

  it 'should not access this page if user is not connected.' do
    visit new_category_exchange_path @cat1
    expect(page).to_not have_content '⇽'
    expect(page).to_not have_content 'New Transaction'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end

  it 'should access this page if user is connected' do
    visit new_user_session_path
    fill_in 'Email', with: 'candy@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'

    visit new_category_exchange_path @cat1
    expect(page).to have_content '⇽'
    expect(page).to have_content 'New Transaction'
    expect(page).to_not have_content 'Email'
  end
end