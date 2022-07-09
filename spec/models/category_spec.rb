require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @candy = User.create(name: 'Candy', email: 'candy@gmail.com', password: '123456')
    expect(@candy).to be_valid
    @shoes_category = Category.create(name: 'Shoes', icon: 'S', user_id: @candy.id)
  end

  after(:each) do
    User.destroy_all
    Category.destroy_all
  end

  it 'is valid with valid attributes' do
    expect(@shoes_category).to be_valid
  end

  it 'is invalid without a name' do
    @shoes_category.name = nil
    expect(@shoes_category).to_not be_valid
  end

  it 'is invalid without an icon' do
    @shoes_category.icon = nil
    expect(@shoes_category).to_not be_valid
  end

  it 'is invalid if name length is more than 30 characters' do
    @shoes_category.name = 'a' * 40
    expect(@shoes_category).to_not be_valid
  end
end
