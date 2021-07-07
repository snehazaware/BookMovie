require "rails_helper"

RSpec.describe Theatre, type: :model do
  context "validation tests" do
    it "validates presence" do
      theatre = Theatre.new
      theatre.validate
      expect(theatre.errors[:name]).to include("can't be blank")
      expect(theatre.errors[:pincode]).to include("can't be blank")
    end
  end
end
