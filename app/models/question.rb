class Question < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :replies

  after_validation :generate_slug

  has_rich_text :body

  paginates_per 20

  default_scope { includes(:user, :category) }
  scope :with_replies, -> { includes(:replies) }

  def generate_slug
    self.slug = title.parameterize
  end

  def to_param
    slug
  end
end
