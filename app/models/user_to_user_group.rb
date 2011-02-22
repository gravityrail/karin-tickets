class UserToUserGroup < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_group
end

# == Schema Information
#
# Table name: user_to_user_groups
#
#  id            :integer         not null, primary key
#  user_id       :integer
#  user_group_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

