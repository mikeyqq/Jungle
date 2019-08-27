require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validation' do

    user = User.new(name: 'Tester', email: 'tester@gmail.com', password: "hello", password_confirmation: "hello")

    it "is valid with valid attributes" do
      expect(user).to be_valid
    end

    it "is not valid with different passwords" do
      user.password = 'tester'
      expect(user).to_not be_valid
    end

    it "is not valid when not case sensitive unique emails" do
      user.email = 'Tester@gmail.COM'
      expect(user).to_not be_valid
    end

  end
end
