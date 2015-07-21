class AddPositionToContent < ActiveRecord::Migration
  def up
  	add_column "contents", 'position', :integer
  end

  def down 
  	remove_column "contents", "position"
  end
end
