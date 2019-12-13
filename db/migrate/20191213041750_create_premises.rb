class CreatePremises < ActiveRecord::Migration[5.2]
  def change
    create_table :premises do |t|
      t.references :user, index: false
      t.references :organization, index: false
      t.string :name
      t.string :address
      t.jsonb :notes, default: []
      t.timestamps
    end
  end
end
