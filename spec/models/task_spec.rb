require 'rails_helper'

describe Task, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :due_date }
  end
end
