class Thing < ApplicationRecord
  has_one :category
  has_many :little_things
  accepts_nested_attributes_for :category, :little_things
end
