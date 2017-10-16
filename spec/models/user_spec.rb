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
end
