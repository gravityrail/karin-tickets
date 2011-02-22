require 'spec_helper'

describe Transaction do
  pending "add some examples to (or delete) #{__FILE__}"
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

