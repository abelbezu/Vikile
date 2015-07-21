class AddImageToArticle < ActiveRecord::Migration
  
  def up
   		add_column "articles", 'main_image', :string, :default=>'article_default.jpg'
  end
  
  def down
  	remove_column "articles", 'main_image'
  end
end
