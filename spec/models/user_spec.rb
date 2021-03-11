require "rails_helper"

RSpec.describe User, type: :model do
  let!(:users) do
    [create(:user), create(:user), create(:admin)]
  end
  it "uses match_array to match a scope" do
    expect(User.all).to match_array(users)
  end
end
