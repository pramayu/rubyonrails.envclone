class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
		 :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
	has_many :themes
	has_many :comments
	acts_as_voter
	ratyrate_rater

	has_many :friendships
	has_many :friends, :through => :friendships

	has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
	has_many :inverse_friends, :through => :inverse_friendships, source: :user

	has_attached_file :profile, styles: { medium: "300x300#", thumb: "80x80#" }
	validates_attachment_content_type :profile, content_type: /\Aimage\/.*\Z/
	has_attached_file :homepage, styles: { medium: "590x245#" }
	validates_attachment_content_type :homepage, content_type: /\Aimage\/.*\Z/

	def login=(login)
		@login = login
	end

	def login
		@login || self.username || self.email
	end

	def self.find_for_database_authentication(warden_conditions)
		conditions = warden_conditions.dup
		if login = conditions.delete(:login)
			where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
		elsif conditions.has_key?(:username) || conditions.has_key?(:email)
			where(conditions.to_h).first
		end
	end
end
