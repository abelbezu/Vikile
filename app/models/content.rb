class Content < ActiveRecord::Base
	belongs_to :content_owner, polymorphic: true 

	has_one :image, as: :image_owner
	accepts_nested_attributes_for :image, :reject_if => :all_blank, allow_destroy: true 

	# Below are defined some methods to make common database operations simpler

	scope :part, lambda{where(:type => "part")} 
	has_one :advertisement



	# a method to organize comments may be needed


	scope :sorted, lambda{order("contents.id ASC")}
	scope :most_popular , lambda{order("contents.likes DESC")}
	scope :newest_first, lambda{order("contents.created_at DESC")}


	def get_params
		return ActionController::Parameters.new(self.attributes).permit("content_type", "content_body", "image_url", "position")
	end

	def set_image_url
		unless self.image == nil
			if self.image_url == nil
				self.image_url = self.image.picture.url
			else 
				self.update_attribute("image_url", self.image.picture.url)
			end
			return self.save 
		end
	end

	def set_ad
		
	end 


end
