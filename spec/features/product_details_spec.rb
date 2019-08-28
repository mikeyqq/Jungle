require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(),
        description: Faker::Hipster.paragraph(),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Click on product partials to see product details" do
    # ACT
    visit root_path
    page.find('.products > .product:first-child > header a').click

    # VERIFY

    expect(page).to have_css('.product-detail')


    # DEBUG
    save_screenshot

  end
end
