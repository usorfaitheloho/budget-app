class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :validatable, :confirmable

 ROLES = %i[admin default].freeze

  def is?(requested_role)
    role == requested_role.to_s
    end
    has_many :categories
    has_many :exchanges, foreign_key: 'author_id'
  
    validates :name, presence: true, length: { maximum: 50 }
end
