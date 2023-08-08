class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :movements, foreign_key: 'group_id'

  validates :name, presence: true, uniqueness: { scope: :author_id, message: 'You already have a group with this name', case_sensitive: false }
  validates :icon, presence: true

  def total_amount
    movements = Movement.where(group_id: id).sum(:amount)
  end
end
