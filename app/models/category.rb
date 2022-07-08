class Category < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :slots
  has_many :exchanges, through: :slots


  validates_presence_of :user
  validates :name, presence: true, length: { maximum: 30 }
  validates :icon, presence: true

  def total_amount
    total = 0
    exchanges.each do |exchange|
      total += exchange.amount
    end
    total
  end

end
