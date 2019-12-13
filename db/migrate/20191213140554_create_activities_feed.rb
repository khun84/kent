class CreateActivitiesFeed < ActiveRecord::Migration[5.2]
  def change
    create_table :activities_feeds do |t|
      t.string :detail
      t.integer :activity_type
      t.timestamps
    end
  end
end
