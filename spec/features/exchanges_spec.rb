require 'rails_helper'

RSpec.describe 'exchanges/index', type: :feature do
  before(:each) do
    @candy = User.create(name: 'Candy', email: 'candy@gmail.com',
                         password: '123456', created_at: Time.now, updated_at: Time.now)

    @cat1 = Category.create(name: 'Category_1', icon: 'https://static.thenounproject.com/png/407799-200.png',
                            user: @candy)
    Category.create(name: 'Category_2', icon: 'https://static.thenounproject.com/png/407799-200.png', user: @candy)

    @ex1 = Exchange.create(name: 'transaction 1', amount: '15', author: @candy)
    @ex1.categories << @cat1
    @ex2 = Exchange.create(name: 'transaction 2', amount: '20', author: @candy)
    @ex2.categories << @cat1

    visit new_user_session_path
    fill_in 'Email', with: 'candy@gmail.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end

  after(:each) do
    User.destroy_all
  end

  it 'I can see all exchange for a categorie' do
    visit categories_path

    expect(page).to_not have_content 'TransferMoney'

  end

end