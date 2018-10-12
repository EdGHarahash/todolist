class Task < ApplicationRecord
  belongs_to :category
  has_many :sub_tasks, class_name: "Task", dependent: :destroy
  accepts_nested_attributes_for :sub_tasks

  validates :title, presence: true
  
end
