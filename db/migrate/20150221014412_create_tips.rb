class CreateTips < ActiveRecord::Migration
  def up
    create_table :tips do |t|
     t.references :article
     t.integer :tip_position
     t.timestamps
    end
  end
  def down
  	 drop_table :tips
  end
end
