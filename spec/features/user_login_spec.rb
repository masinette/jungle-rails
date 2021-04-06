require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  # SETUP
  before :each do
    @user = User.create!(
      first_name: 'Shesa',
      last_name: 'Brickhouse',
      email: 'shesa@brickhouse.com',
      password: 'testing'
    )

  end

  scenario "They can login successfully" do
    # ACT
    visit root_path

    first(:link, 'Login').click
    sleep(1)

    fill_in 'email', with: 'shesa@brickhouse.com'
    fill_in 'password', with: 'testing'
    click_on('Submit')

    # # DEBUG / VERIFY
    save_screenshot("capybara test3.png")
    expect(page).to have_text("Signed in as Shesa")

  end
end
