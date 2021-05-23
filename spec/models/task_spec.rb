require 'rails_helper'

describe Task, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
    it { should validate_presence_of :due_date }
  end

  describe "relationships" do
    it {should have_many(:user_tasks)}
    it {should have_many(:users).through(:user_tasks)}
  end
end
