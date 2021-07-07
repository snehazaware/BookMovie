require 'rails_helper'

RSpec.describe TheatreAdmin, type: :model do
  context "validation tests" do
    it "validates presence" do
      ta = TheatreAdmin.new
      ta.validate
      expect(ta.errors[:theatre]).to include("can't be blank")
      expect(ta.errors[:user]).to include("can't be blank")
    end
  end
end
