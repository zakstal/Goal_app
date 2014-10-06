class Goal < ActiveRecord::Base
  validates :title, :description, :status, :privacy, presence: true
  validates :status, inclusion: { in: %w(PENDING COMPLETED)}
  validates :privacy, inclusion: { in: %w(Public Private) }

  belongs_to :user, inverse_of: :goals

  has_many :comments, as: :commentable
end
