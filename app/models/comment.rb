class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  belongs_to  :parent, class_name: 'Comment', optional: true
  has_many    :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy
  scope :newest, ->{order created_at: :desc}

  delegate :name, to: :user
end
