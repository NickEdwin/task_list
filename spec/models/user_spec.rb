require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :job }
  end

  describe "relationships" do
    it {should have_many(:user_tasks)}
    it {should have_many(:tasks).through(:user_tasks)}
  end
end
