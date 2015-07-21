class CreateWarnings < ActiveRecord::Migration
  def up
    create_table :warnings do |t|
    	t.references :article
     t.integer :warning_position
      t.timestamps
    end
  end
  def down
  	drop_table :warnings
  end 
end
