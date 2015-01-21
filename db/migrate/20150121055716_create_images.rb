class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer "image_owner_id"
      t.string "image_owner_type"
      
      t.string "image_body"
     	
      t.timestamps
    end
  end
end
