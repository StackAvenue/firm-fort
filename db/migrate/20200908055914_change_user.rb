class ChangeUser < ActiveRecord::Migration[6.0]
  def up
    change_table :users do |t|
      change_column_null :users, :gender, null: true
      change_column_null :users, :designation, null: true
      change_column_default :users, :designation, from: "Member", to: nil
    end
  end
end
