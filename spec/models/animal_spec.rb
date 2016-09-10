require 'rails_helper'

RSpec.describe Animal, type: :model do
  context "given complete data" do
    it "has all the right attributes" do
      name = "Aardvark"
      legs = 4
      warm_blooded = true
      poisonous = false
      aardvark = Animal.new(name: name,
                            legs: legs,
                            warm_blooded: warm_blooded,
                            poisonous: poisonous)
      expect(aardvark.name).to eq(name)
      expect(aardvark.legs).to eq(legs)
      expect(aardvark.warm_blooded).to eq(warm_blooded)
      expect(aardvark.poisonous).to eq(poisonous)
    end
  end

  context "given partial data" do
    it "requires a number of legs" do
      name = "Aardvark"
      aardvark = Animal.new(name: name)
      expect(aardvark).to be_invalid
    end

    it "requires a number of legs" do
      legs = 4
      aardvark = Animal.new(legs: legs)
      expect(aardvark).to be_invalid
    end
  end

  it { should have_many(:sightings) }
end
