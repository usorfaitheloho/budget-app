class AddCategoryRefToSlots < ActiveRecord::Migration[7.0]
  def change
    add_reference :slots, :category, null: false, foreign_key: true
  end
end
