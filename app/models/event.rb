class Event < ApplicationRecord
  has_many :groups, dependent: :destroy
end
