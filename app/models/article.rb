class Article < ActiveRecord::Base
	
	 has_many :parts, :dependent => :destroy
	 accepts_nested_attributes_for :parts, :reject_if => :all_blank, allow_destroy: true 

	 has_many :editors, :through => :article_edits, :class_name => 'Account'
	 has_many :stats
	 belongs_to :account


	 scope :visible, lambda{where(:visible => true)} #returns an ActiveRecord object where the condition is true
	 scope :invisible, lambda{where(:visible => false)}
	
	 scope :newest_first, lambda{order("articles.created_at DESC")}
	 scope :search, lambda{|query|
	 	where(["name LIKE ?", "%#{query}%"])}


end
