class PermissionToUserGroup < ActiveRecord::Base
  belongs_to :permission
  belongs_to :user_group
end

# == Schema Information
#
# Table name: permission_to_user_groups
#
#  id            :integer         not null, primary key
#  permission_id :integer
#  user_group_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

