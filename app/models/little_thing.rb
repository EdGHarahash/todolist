class LittleThing < ApplicationRecord
  belongs_to :thing
  validates :body, presence: true
end
