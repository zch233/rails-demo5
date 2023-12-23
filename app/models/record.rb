class Record < ApplicationRecord
  validates_presence_of :category, :amount, :sign_time
end
