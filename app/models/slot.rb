class Slot < ApplicationRecord
    belongs_to :categories
    belongs_to :exchanges
end
