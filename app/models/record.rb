class Record < ApplicationRecord
  paginates_per 10

  validates_presence_of :category, :amount, :sign_time
end
