class Transaction < ActiveRecord::Base
=begin
Some explanation is in order.

Put address things in an instance of Address and then set Transaction.address with it.

amount, email, payer_name, payer_country are pretty self-explanatory

processor_userid = Paypal's payer_id
payment_id = PayPal's token, check number, or walk-in id, etc.

payment_media = paypal | check | walkin

comments = Paypal's comments

recorded_by is the current_user for check/walkin, or leave nil for automatic

registration links to the generated registration

=end
  belongs_to :address, :dependent => :destroy
  belongs_to :recorded_by, :class_name => "User"
  has_many :registrations

  #TODO: validations
  
  def self.new_from_paypal_details(details)
    #note that this is not saved on creation!
    t = self.new
    t.address = Address.new_from_paypal_address(details.address)
    t.email = details.email
    t.payer_name = details.name
    t.payer_country = details.payer_country
    t.processor_userid = details.payer_id
    t.payment_id = details.token
    t.payment_media = 'paypal'
    t.comments = nil
    t.recorded_by = nil
    t
  end


end

# == Schema Information
#
# Table name: transactions
#
#  id               :integer         not null, primary key
#  address_id       :integer
#  email            :string(255)
#  payer_name       :string(255)
#  payer_country    :string(255)
#  processor_userid :string(255)
#  payment_id       :string(255)
#  recorded_by_id   :integer
#  amount           :integer
#  comments         :text
#  registration_id  :integer
#  created_at       :datetime
#  updated_at       :datetime
#  payment_media    :string(255)
#

