class RemoveAuthorIdFromExchanges < ActiveRecord::Migration[7.0]
  def change
    remove_column :exchanges, :author_id, :integer
  end
end
