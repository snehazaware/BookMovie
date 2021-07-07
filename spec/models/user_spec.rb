require "rails_helper"

RSpec.describe User, type: :model do
  context "validation tests" do
    it "validates presence" do
      user = User.new
      user.validate
      expect(user.errors[:name]).to include("can't be blank")
      expect(user.errors[:mobileno]).to include("can't be blank")
    end
  end
end
