class ArticleEdit < ActiveRecord::Base
	belongs_to :editor, :class_name =>"Account", :foreign_key =>"account_id"
	belongs_to :article
end
