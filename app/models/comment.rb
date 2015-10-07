class Comment < ActiveRecord::Base
  belongs_to :entry
  belongs_to :user
  default_scope -> {order(created_at: :desc)}
  validates :content, presence: true, length: {maximum: 140}
  validates :entry_id, presence: true
end
