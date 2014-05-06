class Photo < ActiveRecord::Base
	has_one :photographer
	belongs_to :event
	has_many :comments, as: :commentable
	has_and_belongs_to_many :buyers
	has_and_belongs_to_many :tags
	accepts_nested_attributes_for :comments


	# mount_uploader :image, ImageUploader
end