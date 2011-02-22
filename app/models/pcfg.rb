class Pcfg < ActiveRecord::Base
  #TODO: validations
  belongs_to :last_modified_by, :class_name => "User"

  def self.get(key)
    begin
      self.find_by_key(key).value
    rescue ActiveRecord::RecordNotFound
      nil
    rescue NoMethodError
      nil
    end
  end

  def self.set(key, value)
    begin
      pcfg = self.find_by_key(key)
      pcfg.value = value
      pcfg.last_modified_by = current_user
      pcfg.save
      pcfg
    rescue ActiveRecord::RecordNotFound
      pcfg = Pcfg.new
      pcfg.key = key
      pcfg.value = value
      pcfg.last_modified_by = current_user
      pcfg.save
      pcfg
    end
  end

  def self.unset(key)
    begin
      self.find_by_key(key).destroy
      true
    rescue ActiveRecord::RecordNotFound
      false
    end
  end

  def to_s
    key + " => '" + value + "'"
  end
  def to_str
    value
  end
end

# == Schema Information
#
# Table name: pcfgs
#
#  id                  :integer         not null, primary key
#  key                 :text
#  value               :text
#  last_modified_by_id :integer
#  created_at          :datetime
#  updated_at          :datetime
#

