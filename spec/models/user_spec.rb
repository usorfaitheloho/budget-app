require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @candy = User.create(name: 'Candy', email: 'candy@gmail.com', password: '123456')
  end

  it 'is valid with valid attributes' do
    expect(@candy).to be_valid
  end

  it 'is invalid without an email' do
    @candy.email = nil
    expect(@candy).to_not be_valid
  end

  it 'is invalid without a password' do
    @candy.password = ''
    expect(@candy).to_not be_valid
  end

  it 'is invalid without a name' do
    @candy.name = nil
    expect(@candy).to_not be_valid
  end

  it 'is invalid if name length is more than 50 characters' do
    @candy.name = 'a' * 52
    expect(@candy).to_not be_valid
  end

end