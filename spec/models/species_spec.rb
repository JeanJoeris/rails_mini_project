require 'rails_helper'

RSpec.describe Species, type: :model do
  it { should have_many(:animals) }
end
