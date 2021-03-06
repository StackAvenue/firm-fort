class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name, :null => false
      t.string :last_name
      t.string :email, :null => false
      t.string :designation, :null => false
      t.integer :age, default: 18 
      t.string :gender, :null => false
      t.text :address
      t.string :twitter_url
      t.string :linkedin_url
      t.string :github_url
      t.references :organisation, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
    add_index :users, [:email, :organisation_id], unique: true
  end
end
