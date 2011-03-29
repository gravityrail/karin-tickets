class Show < ActiveRecord::Base
  has_many :events, :order => 'start asc'
end

# == Schema Information
#
# Table name: shows
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  byline      :string(255)
#  tagline     :string(255)
#  description :text
#  credits     :text
#  quotes      :text
#  created_at  :datetime
#  updated_at  :datetime
#

