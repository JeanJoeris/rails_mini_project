require 'rails_helper'

RSpec.describe Genus, type: :model do
  it { should have_many(:animals) }
end
