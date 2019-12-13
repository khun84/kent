class CreateServiceRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :service_requests do |t|
      t.references :premise
      t.timestamp :require_at
      t.timestamp :completed_at
      t.integer :status
      t.references :vendor
      t.timestamps
    end
  end
end
