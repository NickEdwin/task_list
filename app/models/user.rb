class User < ApplicationRecord
  validates_presence_of :name,
                        :job

  has_many :user_tasks, dependent: :destroy
  has_many :tasks, through: :user_tasks
end
