class Task < ApplicationRecord

  belongs_to :user
  has_many :articles

  enum status: {Todo: 0, Doing: 1, Done: 2}
  
  include RankedModel
  ranks :row_order
  
end
