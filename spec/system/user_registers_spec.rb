require "rails_helper"

RSpec.describe "User registers", type: :system do
  scenario "with valid details", js: true do
    visit "/"

    click_on "Profile"
    click_link "Sign Up"
    expect(current_path).to eq(new_user_registration_path)

    fill_in I18n.t("activerecord.attributes.user.email"), with: "tester@example.tld"
    fill_in I18n.t("activerecord.attributes.user.password"), with: "test-password"
    fill_in I18n.t("activerecord.attributes.user.password_confirmation"), with: "test-password"
    click_button "Sign up"

    expect(current_path).to eq "/"
    expect(page).to have_content I18n.t("devise.registrations.signed_up")
  end

  context "with invalid details" do
    before do
      visit new_user_registration_path
    end

    scenario "blank fields" do
      click_button "Sign up"
      expect(page).to have_content I18n.t("errors.messages.blank")
    end

    scenario "incorrect password confirmation" do
      fill_in I18n.t("activerecord.attributes.user.email"), with: "tester@example.tld"
      fill_in I18n.t("activerecord.attributes.user.password"), with: "test-password"
      fill_in I18n.t("activerecord.attributes.user.password_confirmation"), with: "not-test-password"
      click_button "Sign up"

      expect(page).to have_content I18n.t("errors.messages.confirmation")
    end

    scenario "already registered email" do
      create(:user, email: "dave@example.tld")

      fill_in I18n.t("activerecord.attributes.user.email"), with: "dave@example.tld"
      fill_in I18n.t("activerecord.attributes.user.password"), with: "test-password"
      fill_in I18n.t("activerecord.attributes.user.password_confirmation"), with: "test-password"
      click_button "Sign up"

      expect(page).to have_content I18n.t("errors.messages.taken")
    end

    scenario "too short password" do
      min_password_length = 6
      too_short_password = "p" * (min_password_length - 1)
      fill_in I18n.t("activerecord.attributes.user.email"), with: "dave@example.tld"
      fill_in I18n.t("activerecord.attributes.user.password"), with: too_short_password
      fill_in I18n.t("activerecord.attributes.user.password_confirmation"), with: too_short_password
      click_button "Sign up"

      expect(page).to have_content I18n.t("errors.messages.too_short.many", count: min_password_length)
    end
  end
end
