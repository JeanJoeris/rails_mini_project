require 'rails_helper'

RSpec.describe Class, type: :model do
  it { should have_many(:animals) }
end
