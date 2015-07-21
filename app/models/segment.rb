class Segment < ActiveRecord::Base
	belongs_to :article
	has_many :contents, as: :content_owner, :dependent => :destroy
	accepts_nested_attributes_for :contents, :reject_if => :all_blank, allow_destroy: true 

	def get_params
		return ActionController::Parameters.new(self.attributes).permit("type", "title", "position")
	end
end
