class Photo < ActiveRecord::Base
	has_one :photographer
	belongs_to :event
	has_and_belongs_to_many :buyers
	has_and_belongs_to_many :tags

	mount_uploader :image, ImageUploader
end