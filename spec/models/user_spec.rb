require 'rails_helper'

describe User do
  it {should validate_presence_of :name}
  it {should validate_presence_of :email}
  it 'encrypts the password' do
    user = FactoryGirl.create(:user)
    user.password_hash.should eq BCrypt::Engine.hash_secret(user.password, user.password_salt)
  end
end