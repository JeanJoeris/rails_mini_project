require 'rails_helper'

RSpec.describe Sighting, type: :model do
  it { should belong_to(:location) }
  it { should belong_to(:animal) }
end
