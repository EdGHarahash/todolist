class User < ApplicationRecord
  has_many :things
  has_many :categories
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
