class CreateContents < ActiveRecord::Migration
  def up
    create_table :contents do |t|
      t.integer "content_owner_id"
      t.string "content_owner_type"
      t.string "content_type"
      t.text "content_body"
      t.text "content_bullet_list"
     
      t.text "picture"
      t.string "video"

      t.timestamps
    end
    add_index("contents", "content_owner_id")
  end
  def down
  	drop_table :contents
  end 
end
