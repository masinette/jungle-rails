require 'rails_helper'
require 'product'

RSpec.describe Product, type: :model do
  it "is valid with valid attributes" do
    
    @category = Category.new(name:'Pants')
    @product = Product.new(name:  'Cool Pants',
      description: "pretty bell-bottoms, unisex pants",
      quantity: 10,
      category: @category,
      price_cents: 20)
    # product = Product.new(name: "pretty pants", price: 20.25, quantity: 5, category_id: "cat1")
    expect(@product).to be_valid
  end
    # validation tests/examples here
    it "is not valid without a name" do
      @category = Category.new(name:'Pants')
      @product = Product.new(name: nil,
        description: "pretty bell-bottoms, unisex pants",
        quantity: 10,
        category: @category,
        price_cents: 20)
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include "Name can't be blank"
      end

    it "is not valid without a price" do
      @category = Category.new(name:'Pants')
      @product = Product.new(name: 'Cool Pants',
        description: "pretty bell-bottoms, unisex pants",
        quantity: 10,
        category: @category,
        price_cents: nil)
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it "is not valid without a quantity" do
      @category = Category.new(name:'Pants')
      @product = Product.new(name: 'Cool Pants',
        description: "pretty bell-bottoms, unisex pants",
        quantity: nil,
        category: @category,
        price_cents: 20)
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it "is not valid without a category" do
      @category = Category.new(name:'Pants')
      @product = Product.new(name: nil,
        description: "pretty bell-bottoms, unisex pants",
        quantity: 10,
        category: nil,
        price_cents: 20)
        expect(@product).to_not be_valid
        expect(@product.errors.full_messages).to include "Category can't be blank"
    end
end
