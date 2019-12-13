class CreateUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :role
      t.references :organization, index: false
      t.integer :status
      t.timestamps
      t.string :email
      t.boolean :primary
    end
  end
end
