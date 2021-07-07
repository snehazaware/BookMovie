require "rails_helper"

RSpec.describe Booking, type: :model do
  context "validation tests" do
    it "validates presence" do
      booking = Booking.new
      booking.validate
      expect(booking.errors[:is_confirm]).to include("can't be blank")
      expect(booking.errors[:show]).to include("can't be blank")
      expect(booking.errors[:user]).to include("can't be blank")
      expect(booking.errors[:seat_number]).to include("can't be blank")
      expect(booking.errors[:amount]).to include("can't be blank")
    end
  end
end
