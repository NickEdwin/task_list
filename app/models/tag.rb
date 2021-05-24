class Tag < ApplicationRecord

  has_many :taggings, dependent: :destroy
  has_many :tasks, through: :taggings

  def to_s
    name
  end
end
