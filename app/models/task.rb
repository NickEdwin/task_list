class Task < ApplicationRecord
  validates_presence_of :title,
                        :description,
                        :due_date

  has_many :user_tasks, dependent: :destroy
  has_many :users, through: :user_tasks
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end
end
