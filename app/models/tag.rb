class Tag < ApplicationRecord
  has_many :record_tags
  has_many :records, through: :record_tags

  validates_presence_of :icon, :name
end
