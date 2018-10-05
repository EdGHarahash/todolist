class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :things
  has_and_belongs_to_many :categories
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
