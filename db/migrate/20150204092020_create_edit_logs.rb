class CreateEditLogs < ActiveRecord::Migration
  def up
    create_table :edit_logs do |t|

      t.references :articles
      t.string "edited_part"
      t.text "previous_value"
      t.text "new_value"
      
      t.string "edit_type"

      t.timestamps
    end

  end
  def down
  	drop_table :edit_logs
  end 
end
