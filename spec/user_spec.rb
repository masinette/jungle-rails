require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    @user = User.new(first_name: "Major",
    last_name: "Tom",
    email: "groundcontrol@majortom.com",
    password: "54321",
    password_confirmation: "54321")
    
    expect(@user).to be_valid
  end

  it "is invalid when passwords confirmation fails" do
    @user = User.new(first_name: "Major",
    last_name: "Tom",
    email: "groundcontrol@majortom.com",
    password: "54321",
    password_confirmation: "12345")
    
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
  end

  it "is not valid without a first and last name" do
    @user = User.new(first_name: nil,
    last_name: nil,
    email: "groundcontrol@majortom.com",
    password: "54321",
    password_confirmation: "54321")
    
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include "First name can't be blank", "Last name can't be blank"
  end

  it "is not valid without an email" do
    @user = User.new(first_name: "Major",
    last_name: "Tom",
    email: nil,
    password: "54321",
    password_confirmation: "54321")
    
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include "Email can't be blank"
  end

  it "is not valid if password is less than 6 characters and more than 20 characters long" do
    @user = User.new(first_name: "Major",
    last_name: "Tom",
    email: "groundcontrol@majortom.com",
    password: "4321",
    password_confirmation: "4321")
    
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include "Password is too short (minimum is 5 characters)"
  end

  # it "emails are unique, and not case sensitive" do
  #   @user1 = User.create(first_name: "Major",
  #   last_name: "Tom",
  #   email: "groundcontrol@majortom.com",
  #   password: "54321",
  #   password_confirmation: "54321")
    
  #   @user = User.create(first_name: "Major",
  #   last_name: "Tom",
  #   email: "GroundControl@MajorTom.com",
  #   password: "54321",
  #   password_confirmation: "54321")

  #   expect(@user.email).to eq "nothing"
  #   expect(@user.errors.full_messages).to include "Email can't be blank"
  # end
  

end
