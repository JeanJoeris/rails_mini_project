require 'rails_helper'

RSpec.describe Phylum, type: :model do
  it { should have_many(:animals) }
end
