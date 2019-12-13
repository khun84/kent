class AddImageUrlToPremise < ActiveRecord::Migration[5.2]
  def change
    add_column :premises, :image_url, :string
  end
end
