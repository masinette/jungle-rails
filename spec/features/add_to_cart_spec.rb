require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They can add items to cart" do
    @category.products.create!(
  name:  Faker::Hipster.sentence(3),
  description: Faker::Hipster.paragraph(4),
  image: open_asset('apparel1.jpg'),
  quantity: 10,
  price: 64.99
  )
    # ACT
    visit root_path

    first(:button, :class => 'btn btn-primary').click
    sleep(1)
    # DEBUG / VERIFY
    save_screenshot("capybara test2.png")
    expect(page).to have_text("My Cart (1)")

  end
end
