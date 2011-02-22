require 'spec_helper'

describe Registration do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: registrations
#
#  id                :integer         not null, primary key
#  ticket_id         :integer
#  price_paid        :float
#  purchaser_id      :integer
#  user_id           :integer
#  date_given        :datetime
#  package_parent_id :integer
#  checked_in        :boolean
#  date_checked_in   :datetime
#  created_at        :datetime
#  updated_at        :datetime
#  transaction_id    :integer
#

