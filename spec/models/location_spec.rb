require 'rails_helper'

RSpec.describe Location, type: :model do
  context "given a name" do
    it "has the name attribute" do
      location = Location.new(name: "Big workspace bathrooms")

      expect(location).to be_valid
      expect(location.name).to eq "Big workspace bathrooms"
    end
  end

  context "given no name" do
    it "requires a name" do
      location = Location.new

      expect(location).to be_invalid
    end
  end

  it { should have_many(:sightings) }
end
