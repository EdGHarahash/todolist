class Thing < ApplicationRecord
  belongs_to :category
  has_many :little_things, dependent: :destroy
  accepts_nested_attributes_for :little_things
end
