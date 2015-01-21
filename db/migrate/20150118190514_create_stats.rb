class CreateStats < ActiveRecord::Migration
  def up
    create_table :stats do |t|
      t.references :article
      t.integer 'shares'
      t.integer 'views'
      t.integer 'helpful'
      t.integer 'edits'
      t.integer 'likes'
      t.timestamps
    end
    add_index("stats", "article_id")
  end

  def down
  	drop_table :stats
  end 
end
