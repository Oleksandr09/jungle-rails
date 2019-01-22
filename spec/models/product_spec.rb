require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should exist' do
      @product = Product.new
     
      expect(@product).to_not be_valid
    end

    it 'should not be valid' do
      @product = Product.new
      @product.name = nil

      expect(@product).to_not be_valid
    end

    it 'should not be valid' do
      @product = Product.new
      @product.price = nil

      expect(@product).to_not be_valid
    end

    it 'should not be valid' do
      @product = Product.new
      @product.category_id = nil

      expect(@product).to_not be_valid
    end

    it 'should not be valid' do
      @product = Product.new
      @product.price = nil

      expect(@product).to_not be_valid
    end

    it 'should be valid' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      pro1 =
      cat1.products.new({
        name:  'Plumbus',
        quantity: 10,
        price: 20.00
      })

      expect(pro1).to be_valid
    end
  end
end
