class Crag < ApplicationRecord
  has_many :nodes, dependent: :destroy
  validates_presence_of :title, :created_by
end
