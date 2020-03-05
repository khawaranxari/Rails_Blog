class User < ActiveRecord::Base

	has_many :articles
	validates :username, presence: true, uniqueness: {case_sensitive: false}, length: { minimum: 3, maximum: 25 }
	VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/
	validates :email, presence: true, uniqueness: {case_sensitive: false}, length: { maximum: 105 },
	format: {with: VALID_EMAIL}
	before_save {self.email = email.downcase}
	has_secure_password
end
