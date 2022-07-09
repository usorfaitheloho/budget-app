class CreateExchanges < ActiveRecord::Migration[7.0]
  def change
    create_table :exchanges do |t|
      t.integer :author_id
      t.float :amount
      t.string :name

      t.timestamps
    end
  end
end
