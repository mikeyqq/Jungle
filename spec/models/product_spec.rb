require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validation' do

  it "is valid with a name" do 
    category = Category.new
    category.save!
    product = Product.new(name: 'hello', price_cents: 50, quantity: 50, category_id: category.id)
    expect(product).to be_valid
  end

  it "is not valid without a name" do
    category = Category.new
    category.save!
    product = Product.new(name: nil, price_cents: 50, quantity: 50, category_id: category.id)
    expect(product).to_not be_valid
  end

  it "is not valid without a price" do
    category = Category.new
    category.save!
    product = Product.new(name: "hello", price_cents: nil, quantity: 50, category_id: category.id)
    expect(product).to_not be_valid
  end

  it "is not valid without quantity" do
    category = Category.new
    category.save!
    product = Product.new(name: "hello", price_cents: 50, quantity: nil, category_id: category.id)
  end

  it "is not valid without category" do
    category = Category.new
    category.save!
    product = Product.new(name: "hello", price_cents: 50, quantity: 50, category_id: nil)
  end
  
end
end
