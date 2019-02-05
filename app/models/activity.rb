# == Schema Information
#
# Table name: activities
#
#  id          :integer          not null, primary key
#  complexity  :string
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

class Activity < ApplicationRecord
  belongs_to :venue
  has_and_belongs_to_many :categories
  scope :by_name, -> { order(:name) }
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :schedule, presence: true
  validates :complexity, presence: true
end
