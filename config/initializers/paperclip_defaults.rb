module Paperclip
  # The Attachment class manages the files for a given attachment. It saves
  # when the model saves, deletes when the model is destroyed, and processes
  # the file upon assignment.
  class Attachment
    
    def self.default_options
      @default_options ||= {
        :url               => "/system/:attachment/:id/:style/:filename",
        :path              => ":rails_root/public:url",
        :styles            => {},
        :processors        => [:thumbnail],
        :convert_options   => {},
        :default_url       => "/:attachment/:style/missing.png",
        :default_style     => :original,
        :storage           => :filesystem,
        :use_timestamp     => true,
        :whiny             => Paperclip.options[:whiny] || Paperclip.options[:whiny_thumbnails],
        :storage => :s3, # if you wish to use S3 everywhere, change this to :storage => :s3
        :s3_credentials => S3_CONFIG
      }
      
    end
  end
end