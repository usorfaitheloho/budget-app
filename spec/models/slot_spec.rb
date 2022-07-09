require 'rails_helper'

RSpec.describe Slot, type: :model do
  before(:each) do
    @candy = User.create(name: 'Candy', email: 'candy@gmail.com', password: '123456')
    expect(@candy).to be_valid
    @shoes_category = Category.create(name: 'Shoes', icon: 'S', user_id: @candy.id)
    @exchange = Exchange.create(name: 'Shoes', amount: 'S', author_id: @candy.id)
    @slot = Slot.create(category_id: @shoes_category.id, exchange_id: @exchange.id)
  end

  after(:each) do
    User.destroy_all
    Slot.destroy_all
  end

  it 'is valid with valid attributes' do
    expect(@slot).to be_valid
  end

end