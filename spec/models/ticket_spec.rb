require 'spec_helper'

describe Ticket do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: tickets
#
#  id                  :integer         not null, primary key
#  event_id            :integer
#  cents               :float
#  available           :integer
#  date_open           :datetime
#  date_closed         :datetime
#  package             :boolean
#  generates_ticket_id :integer
#  generates_number    :integer
#  created_at          :datetime
#  updated_at          :datetime
#  name                :string(255)     default("Registration for one person"), not null
#  currency            :string(255)
#

