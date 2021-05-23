class Task < ApplicationRecord
  validates_presence_of :title,
                        :description,
                        :due_date
end 
