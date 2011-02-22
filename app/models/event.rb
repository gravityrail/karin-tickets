class Event < ActiveRecord::Base
  #attr_accessible :address_attributes
  has_many :addresses, :dependent => :destroy
  has_many :tickets, :dependent => :destroy
  
  belongs_to :show

  accepts_nested_attributes_for :addresses, :allow_destroy => true
  #TODO: validations

  def find_available_tickets
    tickets.select {|t| t.available?}
  end
  
  def to_label
    return name + ' ' + start.strftime("%B %d, %I:%M %p")
  end

  def seats_available
    #num_seats_available = 0
    #tickets.each do |t|
    #  num_seats_available = num_seats_available + t.available
    #end
    #num_seats_available
    return capacity
  end
  
  def seats_remaining
    num_seats_remaining = capacity
    tickets.each do |t|
      num_seats_remaining = num_seats_remaining - t.sold
    end
    num_seats_remaining
  end
  
  def calculate_num_seats
    tickets.each do |t|
      @num_seats_available = @num_seats_available + t.available
      @num_seats_remaining = @num_seats_remaning + t.remaining
    end
  end
end

# == Schema Information
#
# Table name: events
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  start             :datetime
#  end               :datetime
#  registration_open :boolean
#  visible           :boolean
#  description       :text
#  created_at        :datetime
#  updated_at        :datetime
#  show_id           :integer
#  capacity          :integer         default(0), not null
#

