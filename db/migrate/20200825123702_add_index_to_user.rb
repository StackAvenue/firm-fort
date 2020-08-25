class AddIndexToUser < ActiveRecord::Migration[6.0]
  def change
    add_index :users, [:email, :organisation_id], unique: true
  end
end
