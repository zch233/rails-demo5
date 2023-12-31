class Tag < ApplicationRecord
  has_many :record_tags
  has_many :records, through: :record_tags
  belongs_to :user

  validates_presence_of :icon, :name
end
