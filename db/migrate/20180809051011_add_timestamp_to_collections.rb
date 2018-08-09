class AddTimestampToCollections < ActiveRecord::Migration[5.2]
  def change
  add_column :collections, :created_at, :datetime
  add_column :collections, :updated_at, :datetime 
  end
end
