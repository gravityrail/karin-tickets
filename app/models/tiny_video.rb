class TinyVideo < ActiveRecord::Base
  
  has_attached_file :original
  #, :path => "videos/:original/:id.:extension",

end

# == Schema Information
#
# Table name: tiny_videos
#
#  id                    :integer         not null, primary key
#  original_file_name    :string(255)
#  original_file_size    :string(255)
#  original_content_type :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#

