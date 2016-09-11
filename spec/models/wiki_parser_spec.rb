require 'rails_helper'

RSpec.describe WikiParser, type: :model do
  it "grabs the taxonomical data of a real species" do
    taxonomical_data = WikiParser.get_taxonomical_data("Platypus")

    expect(taxonomical_data["Kingdom"]).to eq("Animalia")
    expect(taxonomical_data["Phylum"]).to eq("Chordata")
    expect(taxonomical_data["Class"]).to eq("Mammalia")
    expect(taxonomical_data["Order"]).to eq("Monotremata")
    expect(taxonomical_data["Family"]).to eq("Ornithorhynchidae")
    expect(taxonomical_data["Genus"]).to eq("Ornithorhynchus")
    expect(taxonomical_data["Species"]).to eq("Anatinus")
  end

  it "grabs the taxonomical data of a real genus" do
    taxonomical_data = WikiParser.get_taxonomical_data("Zebra")

    expect(taxonomical_data["Kingdom"]).to eq("Animalia")
    expect(taxonomical_data["Phylum"]).to eq("Chordata")
    # expect(taxonomical_data["Class"]).to eq("Mammalia")
    expect(taxonomical_data["Order"]).to eq("Perissodactyla")
    expect(taxonomical_data["Family"]).to eq("Equidae")
    expect(taxonomical_data["Genus"]).to eq("Equus")
    # expect(taxonomical_data["Species"]).to eq("Anatinus")
  end

  it "grabs nothing for non-animals" do
    taxonomical_data = WikiParser.get_taxonomical_data("Car")

    expect(taxonomical_data.values.uniq).to eq([nil])
  end
end
