class Permission < ActiveRecord::Base
  acts_as_tree :order => :code
  
  has_many :permission_to_user_group
  has_many :user_groups, :through => :permission_to_user_group
  #TODO: make this work, delete #build_users and #users
  #has_many :users, :source => :user_groups
#  belongs_to :parent, :class_name => "Permission"

  
  #TODO: validations
  def build_users
    #ideally, this would be handled by the has_many :permissions, but that
    #doesn't work no matter what I try
    groups = self.user_groups
    users = groups.collect do |g|
      g.users.collect do |p|
        p
      end
    end
    users.flatten
  end
  private :build_users

  def users
    #we only should calculate this once, because it's expensive
    @users ||= build_users
  end

end

# == Schema Information
#
# Table name: permissions
#
#  id         :integer         not null, primary key
#  name       :string(255)     not null
#  code       :string(255)     not null
#  category   :string(255)     default("General"), not null
#  parent_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

