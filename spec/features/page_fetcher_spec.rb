require 'rails_helper'

feature "Fetch a page from facebook" do
  scenario "renders the form" do
    visit "/"
    expect(page).to have_content("Facebook page id. Example: 329069337200839")
    expect(page).to have_content("Add")
  end

  scenario "when providing the page id" do
    visit "/"
    within "#facebook-fetcher" do
      fill_in "#facebook-id", with: "329069337200839"
    end

    within "#stored-pages-container" do
      expect(page).to have_content("Tangosource Mexico")
    end
  end
end
