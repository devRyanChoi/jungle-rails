require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "Validations" do
  before(:each) do 
      @user = User.new(
        first_name: "test", 
        last_name: "user", 
        email: "test@test.com", 
        password: "123456789", 
        password_confirmation: "123456789"
        )
    end

    it "expects user to be valid" do
      expect(@user).to be_valid 
    end

    it "expects user not to be valid if password is nil" do
      @user.password = nil
      expect(@user).not_to be_valid 
    end

    it "expects user not to be valid if password is less than 8 characters" do
      @user.password = "12345"
      expect(@user).not_to be_valid 
    end

    it "User should not be created if passwords do not match" do
      @user.password_confirmation = "seecretly"
      expect(@user).not_to be_valid
    end

    it "User should not be created if confirmation password is nil" do
      @user.password_confirmation = nil
      expect(@user).not_to be_valid
    end

     it "No other user can share the same EMAIL" do
      @user2 = User.new(
        first_name: "test2", 
        last_name:"user2", 
        email: "TEST@TEST.com", 
        password:"secretlife", 
        password_confirmation:"secretlife"
        ) 
      @user.save!
      @user2.save
      expect(@user2.errors.full_messages[0]).to eq("Email has already been taken")  
    end
  end


    describe '.authenticate_with_credentials' do
      before(:each) do
        @user = User.create(
          first_name: "Dan",
          last_name: "Jung",
          email: "test@test.com",
          password: "123456789",
          password_confirmation: "123456789"
        )
      end

      it "should be valid if email and user is not nil" do
        user = User.authenticate_with_credentials("test@test.com", "123456789")
        expect(user).not_to eq(nil)
      end
      
      it "should not be valid if email and user is nil" do
        user = User.authenticate_with_credentials("nil", "123456789")
        expect(user).to eq(nil)
      end
      
      it "should not be valid if email and user is nil" do
        user = User.authenticate_with_credentials("test@test.com", "nil")
        expect(user).to eq(nil)
      end

      it "should be valid if email contains empty spaces" do
      user = User.authenticate_with_credentials("   test@test.com   ", "123456789")
      expect(user).not_to eq(nil)
     end

     it "should be valid if email contains random capitals" do
      user = User.authenticate_with_credentials("tESt@tEst.com", "123456789")
      expect(user).not_to eq(nil)
     end
  end
end