require 'rails_helper'

RSpec.describe Node, type: :model do
  it { should belong_to(:crag) }

  it { should validate_presence_of(:xcoord) }
end
