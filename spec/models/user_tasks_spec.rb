require "rails_helper"

describe UserTask, type: :model do
  describe "relationships" do
    it {should belong_to(:user)}
    it {should belong_to(:task)}
  end
end
