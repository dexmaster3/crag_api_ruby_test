class Node < ApplicationRecord
  belongs_to :crag

  validates_presence_of :xcoord
end
