class Tag < ApplicationRecord
  validates_presence_of :name

  has_many :taggings, dependent: :destroy
  has_many :tasks, through: :taggings
end
