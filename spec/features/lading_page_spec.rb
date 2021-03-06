require 'rails_helper'

feature "Landing page content" do
  scenario "Visiting the page" do
    visit "/"

    expect(page).to have_content("FetcherApp")
    expect(page).to have_content("Login with facebook to get started")
  end
end
