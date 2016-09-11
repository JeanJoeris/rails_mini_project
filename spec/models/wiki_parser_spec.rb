require 'rails_helper'

RSpec.describe WikiParser, type: :model do
  it "grabs the taxonomical levels of a real species" do
    wp = WikiParser.new
    taxonomical_data = wp.get_taxonomical_data("Platypus")

    expect(taxonomical_data["Kingdom"]).to eq("Animalia")
    expect(taxonomical_data["Phylum"]).to eq("Chordata")
    expect(taxonomical_data["Class"]).to eq("Mammalia")
    expect(taxonomical_data["Order"]).to eq("Monotremata")
    expect(taxonomical_data["Family"]).to eq("Ornithorhynchidae")
    expect(taxonomical_data["Genus"]).to eq("Ornithorhynchus")
    expect(taxonomical_data["Species"]).to eq("anatinus")
  end
end
