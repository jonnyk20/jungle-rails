require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'should save with valid data' do
      @user = User.create(name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
      expect(@user).to be_persisted
    end
    it 'should not save if email is missing' do
      @user = User.create(name: 'test', email: nil, password: 'test', password_confirmation: 'test')
      expect(@user).to_not be_persisted
    end
    it 'should not save if password is missing' do
      @user = User.create(name: 'test', email: 'test@test.com', password: nil, password_confirmation: 'test')
      expect(@user).to_not be_persisted
    end
    it 'should not save if password confirmation is missing' do
      @user = User.create(name: 'test', email: 'test@test.com', password: 'test', password_confirmation: nil)
      expect(@user).to_not be_persisted
    end
    it 'should not save if passwords do not match' do
      @user = User.create(name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test2')
      expect(@user).to_not be_persisted
    end
    it 'should not save if email exists' do
      @user = User.create(name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
      @user2 = User.create(name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
      expect(@user2).to_not be_persisted
    end
    it 'should not save if email exists with varying case' do
      @user = User.create(name: 'test', email: 'teSt@tEst.com', password: 'test', password_confirmation: 'test')
      @user2 = User.create(name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
      expect(@user2).to_not be_persisted
    end
    it 'should not save if password is too short' do
      @user = User.create(name: 'test', email: 'test@test.com', password: 'te', password_confirmation: 'te')
      expect(@user).to_not be_persisted
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'should log in if password and email are correct' do
      @user = User.create(name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
      @login = User.authenticate_with_credentials(@user.email, @user.password)
      expect(@login).to be_a User
    end

    it 'should log in if password email has leading or trailing space' do
      @user = User.create(name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
      @login = User.authenticate_with_credentials(" " + @user.email + " ", @user.password)
      expect(@login).to be_a User
    end

    it 'should log in if password email has varying case' do
      @user = User.create(name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
      @login = User.authenticate_with_credentials('tEst@test.com', @user.password)
      expect(@login).to be_a User
    end

    it 'should log in if email does not exist' do
      @user = User.create(name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
      @login = User.authenticate_with_credentials('invalid@test.com', @user.password)
      expect(@login).not_to be_a User
    end

    it 'should log in if password is incorect' do
      @user = User.create(name: 'test', email: 'test@test.com', password: 'test', password_confirmation: 'test')
      @login = User.authenticate_with_credentials(@user.email, 'invalid')
      expect(@login).not_to be_a User
    end

  end

end
