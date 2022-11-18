class Comment < ApplicationRecord
  belongs_to :blog
  validates :description, presence: true
end
