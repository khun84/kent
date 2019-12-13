class CreateServiceAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :service_areas do |t|
      t.name
      t.timestamps
    end
  end
end
