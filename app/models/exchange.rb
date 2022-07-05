class Exchange < ApplicationRecord
    belongs_to :user
    has_many :slots
    has_many :categories, through: :slots

    validate_presence_of :name, :amount, :author
end
