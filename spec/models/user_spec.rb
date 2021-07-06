require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do 
    it 'ensures email presence' do
      user = User.new(name: 'First', password: "123", mobileno: 123456789, role: "user").save
      expect(user).to eq(false)
    end
    it 'ensures password presence' do
      user = User.new(name: 'First', email: "abc@gmail.com", mobileno: 123456789, role: "user").save
      expect(user).to eq(false)
    end
  end

  context 'scope tests' do 
  end
  
end
