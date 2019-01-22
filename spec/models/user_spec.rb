require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation examples here
    it 'should not be valid' do
      @user = User.new
      
      expect(@user).to_not be_valid
    end
 

  it 'should not be valid' do
    @user = User.new
    @user.password = nil

    expect(@user).to_not be_valid
  end

  it 'should not be valid' do
    @user = User.new
    @user.password_confirmation = nil

    expect(@user).to_not be_valid
  end

  it 'should not be valid' do
    @user = User.new
    @user.password_confirmation != @user.password

    expect(@user).to_not be_valid
  end

  it 'should not be valid' do
    @user = User.new
    @user.password = 'passwor'

    expect(@user).to_not be_valid
  end

  it 'should be valid' do
    @user = User.new
    @user.password = 'password'
    @user.password_confirmation = 'passwords'
    expect(@user).to_not be_valid
  end

  it 'email must be unique' do
    user = User.new(email: 'bugs', password: '12345678', password_confirmation: '12345678')
    user.save
  
    u = User.new(email: 'bugs', password: '12345678', password_confirmation: '12345678')
    u.save
  
    expect(u.errors.get(:email)).to eq(["has already been taken"])
  end
end

  describe '.authenticate_with_credentials' do
    # examples for this class method here

    it 'should be valid' do
      @user = User.create(first_name: "Peter", last_name: "Parker", email: "test@email.com", password: "spiderman", password_confirmation: "spiderman")
      user = User.authenticate_with_credentials("test@email.com", "spiderman")

      expect(user).to_not be_nil
    end
  end

end
