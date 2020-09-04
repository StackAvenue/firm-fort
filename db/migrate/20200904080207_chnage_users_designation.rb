class ChnageUsersDesignation < ActiveRecord::Migration[6.0]
  def up
    change_table :users do |t|
      change_column_null :users, :designation, null: true
      change_column_default :users, :designation, from: true , to: "Member"
    end
  end

  def down 
    change_table :users do |t|
      change_column_null :users, :designation, null: false
    end
  end
end
