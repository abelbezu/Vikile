class CreateParts < ActiveRecord::Migration
  def up
    create_table :parts do |t|
      t.references :article
      t.string 'part_type'
      t.string 'part_title'
      t.integer 'position'

      t.timestamps
    end
    add_index(:parts, 'article_id')
  end
  def down
  	drop_table :parts
  end
end
