require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do

    user = User.new(name: "tester", email:"tester@tester.com", password: "test", password_confirmation: "test")
    
    it "is valid with valid attributes" do 
      expect(user).to be_valid
    end

    it "is not valid when the password and password confirmation don't match" do 
      user.password = "TEST"
      expect(user).to_not be_valid
    end

    it "is not valid when there is no name enter" do 
      user.name = nil
      expect(user).to_not be_valid
    end

    it "is not valid when there is no email enter" do 
      user.email = nil
      expect(user).to_not be_valid
    end

    it "is not valid when the email already exists in the database" do 
      user = User.new(name: "tester", email:"tester@tester.com", password: "test", password_confirmation: "test")
      user.save!
      user2 = User.new(name: "tester", email:"tester@tester.com", password: "test", password_confirmation: "test")
      expect(user2).to_not be_valid
    end

    it "is not valid when the password is shorter than 3 characters" do 
      user.password = "ab"
      user.password_confirmation= "ab"
      expect(user).to_not be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    
    it "returns a registered user if correct login credentials are entered" do
      @user = User.new(name: "tester tester", email:"tester@tester.com", password: "test", password_confirmation: "test")
      @user.save!
      expect(User.authenticate_with_credentials("tester@tester.com", "test")).to be_a User
    end

    it "will log in even if there is spaces around their email" do
      @user = User.new(name: "tester tester", email:"tester@tester.com", password: "test", password_confirmation: "test")
      @user.save!
      expect(User.authenticate_with_credentials("  tester@tester.com  ", "test")).to be_a User
    end

    it "will log in even if their email is incorrect" do
      @user = User.new(name: "tester tester", email:"tester@tester.com", password: "test", password_confirmation: "test")
      @user.save!
      expect(User.authenticate_with_credentials(" testEr@TesTeR.cOm  ", "test")).to be_a User
    end

  end
  
end