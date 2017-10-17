require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end
  
    scenario "They add a product to the cart" do
      # ACT
      visit root_path
      # save_screenshot
      # first('.fa-shopping-cart').click
      first('article.product').find_link('Add').click
      # first('article.product .btn-primary').click
      # puts page.html

      # DEBUG / VERIFY
      expect(page).to have_text 'My Cart (1)'
      save_screenshot 'cart.png'
      #have_text '(1)'

    end
end
