require 'rails_helper'

RSpec.describe TaxonomicalClass, type: :model do
  it { should have_many(:animals) }
end
