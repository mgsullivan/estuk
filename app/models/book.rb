class Book < ActiveRecord::Base
	belongs_to :user
	has_attached_file :image
	has_attached_file :resource

	validates_attachent_content__type :image,
	content_type: /^image\/(png|gif|jpg)/,
	message: "Only images allowed for image upload"

	validates_attachment_content_type :resource
	content_type: ['application/pdf'],
	message: "Only PDFs allowed for resource upload"

	validates :image, attachment_presence: true, message: "All books must have an image"
	validates :resource, attachment_presence: true, message: "All books must have a resource"
end
