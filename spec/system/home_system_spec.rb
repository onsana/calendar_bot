require "rails_helper"

RSpec.describe "Home", type: :system do
  it 'it work' do
    visit root_path
    expect(page).to have_text("THIS DAY IN HISTORY")
  end
end