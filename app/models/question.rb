class Question < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :replies

  paginates_per 20
  
  default_scope { includes(:user, :category) }
  scope :with_replies, -> { includes(:replies) }

  def to_param
    slug 
  end
end
