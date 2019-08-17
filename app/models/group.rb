class Group < ApplicationRecord
  belongs_to :event
  belongs_to :leader, class_name: 'User'

  has_and_belongs_to_many :users
end
