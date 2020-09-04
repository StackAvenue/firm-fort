class ChangeUsersGender < ActiveRecord::Migration[6.0]
  def up
    change_table :users do |t|
      change_column_null :users, :gender, null: true
    end
  end

  def down 
    change_table :users do |t|
      change_column_null :users, :gender, null: false
    end
  end
end

