require 'rails_helper'

feature "User creates an issue", %q(
  As a user
  I want to create an issue
  So that I can track the progress of the issue

  Acceptance Criteria:
  [ ] I must provide a title
  [ ] I must provide description
  [ ] I can mark the issue as reproducible
  [ ] I can specify the category of the issue
) do

  context "with valid attributes" do
    it "creates an issue with valid attributes" do
      visit '/issues/new'

      fill_in "Title", with: "Broken link"
      fill_in "Description", with: "The sign in link is broken"
      check "Is reproducible"
      # Now we're using the select method to select an option by name
      select "Feature Request", from: "Category"
      click_on "Create Issue"

      expect(page).to have_content "Issue was successfully created"
    end
  end

  context "with invalid attributes" do
    it "sees errors for invalid attributes" do
      visit '/issues/new'

      click_on "Create Issue"

      expect(page).to have_content "Title can't be blank"
      expect(page).to have_content "Description can't be blank"
      expect(page).to have_content "Category can't be blank"
    end
  end
end
