require 'rails_helper'

feature "Fetch a page from facebook", :js do
  pending "renders the form" do
    visit "/"
    expect(page).to have_content("Facebook page id. Example: 188091757763")
    expect(page).to have_content("Add")
  end

  pending "when providing the page id" do
    visit "/"
    within "#facebook_fetcher" do
      fill_in "facebook_id", with: "188091757763"
    end

    within "#stored-pages-container" do
      expect(page).to have_content("Tigerlily")
    end
  end
end
