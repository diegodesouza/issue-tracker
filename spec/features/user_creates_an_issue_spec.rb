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
      # Check the checkbox with a label that says 'Is reproducible'
      check "Is reproducible"
      fill_in "Category", with: "bug"
      click_on "Create Issue"

      expect(page).to have_content "Issue was successfully created"
    end
  end

  context "with invalid attributes" do
    it "sees errors for invalid attributes"
  end
end
