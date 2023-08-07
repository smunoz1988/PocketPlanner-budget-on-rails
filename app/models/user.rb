class User < ApplicationRecord
  validates :name, presence: true
  has_many :groups, foreign_key: 'author_id'
  has_many :movements, foreign_key: 'author_id'
end
