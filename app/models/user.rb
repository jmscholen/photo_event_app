#require 'bcrypt'

class User < ActiveRecord::Base
	has_secure_password
	has_many :comments, as: :commentable
	validates_presence_of :email, :password, :name, :type
	validates_uniqueness_of :email
	

end


