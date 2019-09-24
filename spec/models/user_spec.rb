require 'rails_helper'

RSpec.describe User, type: :model do
  subject {described_class.new(
    first_name: "Abcdef",
    last_name: "Everything",
    email: "my@email.com",
    password: "Abcdef",
    password_confirmation: "Abcdef"
  )}

  describe 'Validations' do
    # validation examples here
   
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
    it "must be created with both password and password_confirmation" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without first name" do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without last name" do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end
    it "is not valid without email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    it "is not valid if password length less than 6 characters" do
      subject.password = "abcde"
      subject.password_confirmation = "abcde"
      expect(subject).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it "should return user if it exists" do
      subject.save
      @user = User.authenticate_with_credentials("my@email.com ", "Abcdef")
      expect(@user).to_not be_nil
    end
    it "is return nil if user doesn't exists" do
      subject.save
      @user = User.authenticate_with_credentials("valid.valid@email.com", "Abcdef")
      expect(@user).to be_nil
    end
    it "should return user when email has wrong case" do
      subject.save
      @user = User.authenticate_with_credentials(" my@email.com ", "Abcdef")
      expect(@user).to_not be_nil
    end
    it "should return user when email has trailing space(s)" do
      subject.save
      @user = User.authenticate_with_credentials(" mY@eMail.com ", "Abcdef")
      expect(@user).to_not be_nil
    end
  end

end
