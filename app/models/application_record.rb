class ApplicationRecord < ActiveRecord::Base
  # enum category: [:income, :outgoings]
  enum category: { outgoings: 1, income: 2 }

  primary_abstract_class
end
