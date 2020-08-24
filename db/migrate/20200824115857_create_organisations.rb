class CreateOrganisations < ActiveRecord::Migration[6.0]
  def change
    create_table :organisations do |t|
      t.string :name, :null => false
      t.text :description
      t.index :name, unique: true

      t.timestamps
    end
  end
end
