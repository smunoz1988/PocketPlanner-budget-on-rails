class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :movements, foreign_key: 'group_id'
end
