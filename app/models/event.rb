class Event < ActiveRecord::Base
	has_many :photos
	has_many :photographers
	has_many :comments, as: :commentable

end