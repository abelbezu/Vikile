class CreateArticles < ActiveRecord::Migration
  def up
    create_table :articles do |t|
     	t.references :account
    	t.string "title"
    	t.string "category"
      t.text "introduction"
    	t.string "tags"
    	t.string "visible", :default => true
    	t.timestamps
    end
    add_index('articles', "account_id")
  end
  def down
  	drop_table :articles
  end

end
