require 'rails_helper'

RSpec.describe Crag, type: :model do
  it { should have_many(:nodes).dependent(:destroy) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:created_by) }
end
