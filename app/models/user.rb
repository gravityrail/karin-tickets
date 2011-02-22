class User < ActiveRecord::Base

	validates :given_name, :presence => true, :length => { :minimum => 1 }
	validates :family_name, :presence => true, :length => { :minimum => 1 }
	validates :email, :presence => true

	validates_format_of :email, 
			:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

	has_many :addresses, :dependent => :destroy

  has_many :user_to_user_group
  has_many :user_groups, :through => :user_to_user_group
  #TODO: make this work and get rid of #permissions and #build_permissions
  #has_many :permissions, :through => :user_groups, :source => :user_groups

	acts_as_authentic do |c|
		c.require_password_confirmation = false
	end
	
  def self.find_one_by_handle(handle)
		@l = find(:all, :conditions => ["LOWER(handle) = ?", handle.downcase])
		if @l.length > 1
			@l
		else
			@l[0]
		end
	end
	def self.find_by_handle(handle)
		find(:all, :conditions => ["LOWER(handle) = ?", handle.downcase])
	end

  def build_permissions
    #ideally, this would be handled by the has_many :permissions, but that
    #doesn't work no matter what I try
    #
    #TODO: improve efficiency of this giant thing
    groups = self.user_groups
    perms = groups.collect do |g|
      g.permissions.collect do |p|
        [p, p.descendants]
      end
    end
    perms.flatten.uniq
  end
  private :build_permissions

  def permissions
    #we only should calculate this once, because it's expensive
    @permissions ||= build_permissions
  end

	def can(permission_code)
		#TODO: Implement some kind of cache, as it's likely that the same
    #permission will hit more than once is a page load, no sense in going
    #through all of the permissions again every time.
    if permissions.select {|p| p.code == permission_code }.count != 0
      true
    else
      if RAILS_ENV == "development" and not Permission.exists?(:code => permission_code)
        raise _("Permission code %s does not exist") % permission_code
      end
    end
    #true
	end

	def has_handle
		return (handle and not handle.empty?)
	end

	def display_name
		return handle if has_handle
		return "%s %s" % [given_name, family_name]	
	end

	def full_name
		return '%s "%s" %s' % [given_name, handle, family_name] if has_handle
		return display_name
	end

end

# == Schema Information
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  given_name          :string(255)
#  family_name         :string(255)
#  handle              :string(255)
#  email               :string(255)
#  gaming_group        :string(255)
#  date_arrival        :datetime
#  date_departure      :datetime
#  gamer_type          :integer
#  birthdate           :date
#  gender              :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  password_salt       :string(255)     default("assalted"), not null
#  persistence_token   :string(255)     default("token"), not null
#  single_access_token :string(255)     default("token"), not null
#  perishable_token    :string(255)     default("token"), not null
#  login_count         :integer         default(0), not null
#  failed_login_count  :integer         default(0), not null
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#  crypted_password    :string(255)     default(""), not null
#  disabled            :boolean         default(FALSE), not null
#

