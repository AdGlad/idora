class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.string :collectionid
      t.string :description
      t.integer :user_id 
    end
  end
end
