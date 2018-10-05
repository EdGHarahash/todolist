class Category < ApplicationRecord
  has_many :things
  has_and_belongs_to_many :users
end
