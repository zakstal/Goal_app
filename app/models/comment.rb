class Comment < ActiveRecord::Base
  validates :content, presence: true

  belongs_to :commentable, polymorphic: true
end