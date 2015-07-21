class CreateArticles < ActiveRecord::Migration
  def up
    create_table :articles do |t|
     	t.references :account
    	t.string "title"
    	t.string "category"
      t.text "introduction"
    	t.text "tags"
      t.string "segment_type"
    	t.string "visible", :default => false
      t.string 'status', :default => "draft"
      t.integer "parent_id"
    	t.timestamps
    end
    add_index('articles', "account_id")
    add_index('articles', "parent_id")
  end
  def down
  	drop_table :articles
  end

end
