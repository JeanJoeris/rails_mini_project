require 'rails_helper'

RSpec.describe User, type: :model do
  it "is created as an admin" do
    user = create(:admin_user)

    expect(user.role).to eq("admin")
  end

  it "is created as default role" do
    user = create(:user)

    expect(user.role).to eq("default")
  end

  it { should have_many(:sightings) }
end
