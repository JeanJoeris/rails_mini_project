require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should have_many(:animals) }
  it { should have_many(:families) }
  it { should have_many(:genus) }
  it { should have_many(:species) }
end
