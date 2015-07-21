class CreateSegments < ActiveRecord::Migration
  def up
    create_table :segments do |t|
    t.integer "article_id"
    t.string "type"
    t.string "title"
    t.integer "position"
    t.timestamps
    end
    add_index('segments', "article_id")
  end
  def down
  	drop_table :segments 
  end 

end
