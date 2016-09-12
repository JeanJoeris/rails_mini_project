require 'rails_helper'

RSpec.describe Kingdom, type: :model do
  it { should have_many(:animals) }
  it { should have_many(:phylums) }
  it { should have_many(:taxonomical_classes) }
  it { should have_many(:orders) }
  it { should have_many(:families) }
  it { should have_many(:genus) }
  it { should have_many(:species) }
end
