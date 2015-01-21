class UpdateAccount < ActiveRecord::Migration
  def up
  add_column "Accounts", 'follower_id', :integer, index: true
  	

  end

  def down
  	remove_column "Accounts", 'follower_id'
  	
  end
end
