require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "is valid with valid attributes" do
      @category = Category.new(name: "Anything")
      @product = Product.new(name: "Anything", price: 123.45, quantity: 4, category: @category)
      expect(@category).to be_valid
      expect(@product).to be_valid
    end

    it "is not valid without a name" do
      @category = Category.new(name: "Anything")
      @product = Product.new(name: nil, price: 123.45, quantity: 4, category: @category)
      expect(@product).to_not be_valid
    end
    it "is not valid without a price" do
      @category = Category.new(name: "Anything")
      @product = Product.new(name: "Anything", price: nil, quantity: 4, category: @category)
      expect(@product).to_not be_valid
    end
    it "is not valid without a quantity" do
      @category = Category.new(name: "Anything")
      @product = Product.new(name: "Anything", price: 123.45, quantity: nil, category: @category)
      expect(@product).to_not be_valid
    end
    it "is not valid without a category" do
      @category = Category.new(name: "Anything")
      @product = Product.new(name: nil, price: 123.45, quantity: 4, category: nil)
      expect(@product).to_not be_valid
    end

  end
end
