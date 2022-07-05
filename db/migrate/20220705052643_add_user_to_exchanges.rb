class AddUserToExchanges < ActiveRecord::Migration[7.0]
  def change
    add_column :exchanges, :author_id, :integer
  end
end
