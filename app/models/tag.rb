class Tag < ApplicationRecord
  validates_presence_of :icon, :name
end
