class AddExchangeRefToSlots < ActiveRecord::Migration[7.0]
  def change
    add_reference :slots, :exchange, null: false, foreign_key: true
  end
end
