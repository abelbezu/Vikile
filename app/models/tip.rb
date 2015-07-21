class Tip < ActiveRecord::Base
	belongs_to :article
	has_many :contents, as: :content_owner
	accepts_nested_attributes_for :contents, :reject_if => :all_blank, allow_destroy: true 

	def get_params
		return ActionController::Parameters.new(self.attributes).permit(:tip_position)
	end
end
