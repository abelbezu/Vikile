class CreateArticleEdits < ActiveRecord::Migration
  def up
    create_table :article_edits do |t|
      t.references :article
      t.references :account
      t.string :summary
    	

      t.timestamps
    end
     add_index :article_edits, ["article_id", "account_id"]
  end
  def down
  	drop_table :article_edits
  end
end
