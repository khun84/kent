class AddServiceAreaTypeIdToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :service_requests, :service_type_id, :integer
    add_column :service_requests, :service_area_id, :integer
  end
end
