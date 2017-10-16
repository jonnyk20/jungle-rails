require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save with valid data' do
      @category = Category.create(name: 'a')
      @product = Product.create!(category: @category, price: 1, name: 'a', quantity: 0)
      expect(@product).to be_persisted
    end

    it 'should not save without a name' do
      @category = Category.create(name: 'a')
      @product = Product.create(category: @category, price: 1, name: nil, quantity: 0)
      expect(@product).to_not be_persisted
      expect(@product.errors.messages[:name]).to include('can\'t be blank') 
    end

    it 'should not save without a price' do
      @category = Category.create(name: 'a')
      @product = Product.create(category: @category, price: nil, name: 'a', quantity: 0)
      expect(@product).to_not be_persisted
      expect(@product.errors.messages[:price]).to include('can\'t be blank') 
    end

    it 'should not save without a quantity' do
      @category = Category.create(name: 'a')
      @product = Product.create(category: @category, price: 1, name: 'a', quantity: nil)
      expect(@product).to_not be_persisted
      expect(@product.errors.messages[:quantity]).to include('can\'t be blank')
    end

    it 'should not save without a category' do
      @category = Category.create(name: 'a')
      @product = Product.create(category: nil, quantity: 5, price: 1, name: 'a')
      expect(@product).to_not be_persisted
      expect(@product.errors.messages[:category]).to include('can\'t be blank')
    end

  end
end
