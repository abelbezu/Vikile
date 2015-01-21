class UpdateArticle < ActiveRecord::Migration
  def up
  	add_column :articles, 'status', :string, :default => "draft"
  end
  def down
  	remove_column :articles, 'status'
  end
end
