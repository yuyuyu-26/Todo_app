class Task < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 30 }
  validates :state, presence: true
  validates :limit_date, presence: true
  default_scope -> { order(limit_date: :asc) }
end
