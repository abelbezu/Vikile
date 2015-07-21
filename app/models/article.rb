class Article < ActiveRecord::Base
	
	#Definitional Associations
	has_many :segments, :dependent => :destroy
	has_one :stats
	has_one :image, as: :image_owner
	has_many :edit_logs
	has_many :tips, dependent: :destroy
	has_many :warnings, dependent: :destroy

	
	
	

	belongs_to :account

	

	
                                  
	has_many :versions, class_name: "Article",
                          foreign_key: "parent_id"
 
  	belongs_to :parent, class_name: "Article"
 
 


    ### nesting
    accepts_nested_attributes_for :tips, :reject_if => :all_blank, allow_destroy: true 
    accepts_nested_attributes_for :segments, :reject_if => :all_blank, allow_destroy: true
    accepts_nested_attributes_for :warnings, :reject_if => :all_blank, allow_destroy: true  





	scope :visible, lambda{where(:visible => true)} #returns an ActiveRecord object where the condition is true
	scope :invisible, lambda{where(:visible => false)}

	scope :entertainment, lambda{where(:category => 'Entertainment')}	
	scope :sports, lambda{where(:category => 'Sports')}
	scope :technology, lambda{where(:category => 'Technology')}
	scope :relationships, lambda{where(:category => 'Relationships')}
	scope :health, lambda{where(:category => 'Health')}
	scope :turkish_culture, lambda{where(:category => 'Turkish Culture')}
	scope :education, lambda{where(:category => 'Education')}
	scope :business_life, lambda{where(:category => 'Business')}
	scope :personal, lambda{where(:category => 'Personal')}
	scope :first_entry, lambda{}
    scope :second_entry, lambda{where(:category => 'personal')}
	scope :third_entry, lambda{where(:category => 'personal')}


	scope :newest_first, lambda{order("articles.created_at DESC")}
	 
	

	scope :category, lambda{|query|
		where(["category = ?", "%#{query}%"])}
			scope :status, lambda{|query|
	 			where(["status = ?", "%#{query}%"])}


	#return the author of this article
	def get_author
		return Account.find(self.account_id)
	end

	#return a copy of this article
	def deep_copy_for account

		article_copy = Article.new(self.get_params)
		article_copy.update_attribute("account_id", account.id)
		unless self.image == nil
			article.build_image(self.image.get_params)	
		end
		self.segments.each do |s|
			
			s_copy = article_copy.segments.build(s.get_params)
			s.contents.each do |c|
				c_copy = s_copy.contents.build(c.get_params)
				
				
			end
		end

		self.tips.each do |t|
			t_copy = article_copy.tips.build(t.get_params)
			t.contents.each do |tc|
				tc_copy = t_copy.contents.build(tc.get_params)
			end 

		end
		self.warnings.each do |w|
			w_copy = article_copy.warnings.build(w.get_params)
			w.contents.each do |wc|
				wc_copy = w_copy.contents.build(wc.get_params)
			end 
			
		end

		return article_copy
	
	end



	def create_editable_version_for account
		editable_version = self.deep_copy_for account
		editable_version.status = "editable"
		editable_version.parent_id = self.id
		if editable_version.save
			return editable_version
		else
			return false
		end
	end
	
	#takes a copy of an article as an argumnet and creates a new record in the database
	#returns true if successful
	
	def get_params
		return ActionController::Parameters.new(self.attributes).permit("account_id", "title", "category", "introduction", "tags", "segment_type", "visible", "status", "main_image")
	end

	def get_unpublished_version_by account
		if self.is_editable && self.get_author == account
			return self
		elsif self.versions.count == 0
			return nil
		else
			self.versions.each do |version| 
				unless version.get_unpublished_version_by account == nil
					return version
				end 

			end
		end
		return nil
	end

	def find_version_to_edit account
		if (self.get_unpublished_version_by account) == nil
	       return self.create_editable_version_for account
	    else 
	    	return self.get_unpublished_version_by account
		end
	end


	def pictures_list
		self.set_content_image_urls
		urls = Array.new
		self.segments.each do |x|
			x.contents.each do |b|
				unless b.image_url == nil
					urls << b.image_url
					
				else
					urls << '---no-picture---'

				end 
				
			end
			
		end
		
		return urls.to_json
	end 

	searchable do
		text :title, :boost => 5
		#text :article_contents
	end

	def article_contents

		all_contents = Array.new

		self.segments.each do |segment|

			segment.contents.each do |content|

				all_contents << content.content_body

			end


		end 

	end

	def set_content_image_urls
		self.segments.each do |segment|
			segment.contents.each do |content|
				content.set_image_url
			end
		end 
	end

	def is_editable
		return self.status == "editable" || self.status == "draft"
	end

	def get_flat_version
		flat_version = (self.title + "\n")
		self.segments.each do |segment|
			flat_version += (segment.title + "\n")
			segment.contents.each do |content|
				flat_version += (content.content_body + "\n")
			end
		end
		self.tips.each do |tip|
			tip.contents.each do |tip_content|
				flat_version += (tip_content.content_body + "\n")
			end

		end

		self.warnings.each do |warning|
			warning.contents.each do |warning_content|
				flat_version += (warning_content.content_body + "\n")
			end
		end
			
		return flat_version
	end
end
