require 'rails_helper'

RSpec.describe Kingdom, type: :model do
  it { should have_many(:animals) }
end
