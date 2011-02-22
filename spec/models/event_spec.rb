require 'spec_helper'

describe Event do
  pending "add some examples to (or delete) #{__FILE__}"
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

