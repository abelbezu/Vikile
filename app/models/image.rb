class Image < ActiveRecord::Base

	belongs_to :image_owner
	mount_uploader :picture, ImageUploader


	def get_params
		return ActionController::Parameters.new(self.attributes).permit("url", "picture", "status")
	end
end
