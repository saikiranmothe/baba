	class Upload < ActiveRecord::Base
	attr_accessible :name, :photo, :document, :audio, :video

	has_attached_file :photo, :styles => { :small => "150x150>" },
	              :url  => "/assets/uploads/:id/:style/:basename.:extension",
	              :path => ":rails_root/public/assets/uploads/:id/:style/:basename.:extension"

	# validates_attachment_presence :photo
	validates_attachment_size :photo, :less_than => 5.megabytes
	validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']



	has_attached_file :document, styles: {thumbnail: "60x60#"}
	validates_attachment :document, content_type: { content_type: "application/pdf" }


	has_attached_file :audio
	validates_attachment_content_type :audio, :content_type => [ 'audio/mp3','audio/mpeg'],
                     :file_name => { :matches => [/mp3\Z/] }

	has_attached_file :video
	validates_attachment_content_type :video, :content_type => [ 'video/mp4', 'video.mov', 'video/mpeg','video/mpeg4','video/x-flv',
		'video/x-matroska','video/webm','video/avi','video/ogg','video/x-divx','video/divx','video/x-msvideo', 'video/quicktime', 
		'video/3gpp', 'video/x-ms-wmv', 'flv-application/octet-stream', 'video/mpeg4', 'video/x-la-asf', 'video/x-ms-asf', 
		'video/msvideo', 'video/avi', '"video/x-msvideo', 'video/x-ms-wmv']
end

