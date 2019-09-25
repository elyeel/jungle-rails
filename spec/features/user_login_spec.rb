require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @user = User.create!( 
      first_name: "Anything",
      last_name: "Something",
      email: "my@email.com",
      password: "abcdef",
      password_confirmation: "abcdef"
    )
    
  end

  scenario "A user can login with valid email and password" do
    # ACT
    visit root_path
    visit "/login"
    fill_in('email', :with => "my@email.com")
    fill_in("password", :with => "abcdef")
    click_button "Submit"



    # DEBUG / VERIFY
    sleep 5
    save_screenshot

    expect(page).to have_content 'my@email.com'
  end

end
