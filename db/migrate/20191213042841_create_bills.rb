class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.references :service_request, index: false
      t.jsonb :tasks, default: []
      t.jsonb :materials, default: []
      t.timestamp :paid_at
      t.timestamp :due_at
      t.integer :status
      t.float :amount
      t.timestamps
    end
  end
end
