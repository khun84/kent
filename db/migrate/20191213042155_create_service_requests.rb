class CreateServiceRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :service_requests do |t|
      t.references :premise, index: false
      t.references :user, index: false
      t.timestamp :require_at
      t.timestamp :completed_at
      t.integer :status
      t.references :vendor, index: false
      t.timestamps
    end
  end
end
