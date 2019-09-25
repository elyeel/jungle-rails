require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
    @user = User.create!( 
      first_name: "Anything",
      last_name: "Something",
      email: "my@email.com",
      password: "abcdef",
      password_confirmation: "abcdef"
    )
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

  scenario "They see a products" do
    # ACT
    visit root_path
    visit "/login"
    fill_in('email', :with => "my@email.com")
    fill_in("password", :with => "abcdef")
    click_button "Submit"


    first('button.btn').click

    # DEBUG / VERIFY
    sleep 5
    # save_screenshot

    expect(page).to have_content 'My Cart (1)'
  end

end
