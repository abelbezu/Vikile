class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable

	has_many :articles 

	has_one :image, as: :image_owner 

	has_many :article_edits

	has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id",
                                  dependent: :destroy

     has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships, source: :follower
 
    

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	# validates_presence_of :first_name
	# validates_length_of :first_name, :within => 1..32
	# validates_presence_of :last_name
	# validates_length_of :last_name, :within => 1..32
	

 #    validates :email, :presence => true,
 #    			  :on => :create,
	# 			  :length => {:within => 3..50},
	# 			  :uniqueness => true,
	# 			  :format => {:with => EMAIL_REGEX}


	# validates :password, :presence => true,
	# 					:on => :create,
	# 					 :confirmation => true,
	# 					 :length => {:within => 8..32}

	
	scope :search, lambda{|query|
		where(["first_name LIKE ?", "%#{query}%"])}
		
	def self.from_omniauth(auth)
	  where(provider: auth.provider).first_or_initialize.tap do |user|
	    user.provider = auth.provider
	    user.first_name = auth.info.first_name
	    user.last_name = auth.info.last_name
	    user.email = auth.info.email
	    user.display_name = auth.info.nicname
	    user.create_image(:url => auth.info.image, :status => 'visible')
	    user.oauth_token = auth.credentials.token
	    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	    user.password = "$2a$10$oT656dk9lBHet1/t0dl3XOD" #cKPrdkpgpI.7ofnaJ2pIH29keZtjgK"
	    user.save!
	  end
	end

	#just a test method needs revision before use
	def get_params
		
		return ActionController::Parameters.new(self.attributes).permit(:first_name, :last_name, :email, :provider)

	end

	def facebook
		@facebook ||= Koala::Facebook::API.new(oauth_token)

	end

	#follow a user
	def follow(other_user)
    	active_relationships.create(followed_id: other_user.id)
  	end

  	#Stop following a user
  	def unfollow(other_user)
    	active_relationships.find_by(followed_id: other_user.id).destroy
  	end

  	#returns true if other user follows this user
  	def following?(other_user)
    	following.include?(other_user)
  	end

  	def is_admin
  		return self.privilege == "admin" || self.privilege == "super"
  	end 

  	def is_super
  		return self.privilege == "super"
  	end

end
