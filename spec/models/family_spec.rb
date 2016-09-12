require 'rails_helper'

RSpec.describe Family, type: :model do
  it { should have_many(:animals) }
  it { should have_many(:genus) }
  it { should have_many(:species) }
end
