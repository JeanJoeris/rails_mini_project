require 'rails_helper'

RSpec.describe Sighting, type: :model do
  it { should belong_to(:location) }
  it { should belong_to(:animal) }
  it { should belong_to(:user) }

  context "given the right attributes" do
    it "has the attributes accessible" do
      animal = create(:animal)
      location = create(:location)
      user = create(:user)

      sighting = user.sightings.new(animal: animal, location: location, sighting_time: DateTime.now)

      expect(sighting).to be_valid
      expect(sighting.animal).to eq(animal)
      expect(sighting.location).to eq(location)
      expect(sighting.user).to eq(user)
    end
  end

  context "given incomplete attributes" do
    it "requires animal" do
      location = create(:location)

      sighting = Sighting.new(location: location, sighting_time: DateTime.now)

      expect(sighting).to be_invalid
    end

    it "requires location" do
      animal = create(:animal)

      sighting = Sighting.new(animal: animal, sighting_time: DateTime.now)

      expect(sighting).to be_invalid
    end

    it "requires sighting time" do
      animal = create(:animal)
      location = create(:location)

      sighting = Sighting.new(animal: animal,location: location)

      expect(sighting).to be_invalid
    end
  end
end
