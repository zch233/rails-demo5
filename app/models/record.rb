class Record < ApplicationRecord
  paginates_per 10
  has_many :record_tags
  has_many :tags, through: :record_tags
  belongs_to :user

  validates_presence_of :category, :amount, :sign_time
end
