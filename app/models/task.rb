class Task < ApplicationRecord
  validates_presence_of :title,
                        :description,
                        :due_date

  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
end
