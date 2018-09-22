# == Schema Information
#
# Table name: activities
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  schedule    :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  venue_id    :integer
#
# Indexes
#
#  index_activities_on_venue_id  (venue_id)
#

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
