class Account < ActiveRecord::Base

	has_many :articles

	has_secure_password


	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates_presence_of :first_name
	validates_length_of :first_name, :within => 1..32
	validates_presence_of :last_name
	validates_length_of :last_name, :within => 1..32
	

    validates :email, :presence => true,
				  :length => {:within => 3..50},
				  :uniqueness => true,
				  :format => {:with => EMAIL_REGEX}


	validates :password, :presence => true,
						 :confirmation => true,
						 :length => {:within => 8..32}

	
	scope :search, lambda{|query|
		where(["first_name LIKE ?", "%#{query}%"])}
		
	# def self.from_omniauth(auth)
	#   where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
	#     user.provider = auth.provider
	#     user.uid = auth.uid
	#     user.name = auth.info.name
	#     user.oauth_token = auth.credentials.token
	#     user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	#     user.save!
	#   end
	# end



end
