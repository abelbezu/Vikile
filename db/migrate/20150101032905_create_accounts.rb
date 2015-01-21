class CreateAccounts < ActiveRecord::Migration
  def up
    create_table :accounts do |t|
      t.string 'first_name', :limit => 50
      t.string 'last_name', :limit => 50
      t.string 'email', :null => false
      t.string 'gender'
      t.string 'privilage', :default => 'user'
      t.string "token"
      t.string 'refresh_token'
      t.string 'expires_at'
      t.string 'display_name', :limit => 50
      t.string 'password_digest', :null =>false
      t.string 'picture', :limit =>50, :default => "profile_default.png"
      t.timestamps
    end
  end
  def down
  	drop_table :accounts
  end
end
