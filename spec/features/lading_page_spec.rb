require 'rails_helper'

feature "Landing page content" do
  scenario "Visiting the page" do
    visit "/"

    expect(page).to have_content("Facebook Pages Fetcher")
  end
end
