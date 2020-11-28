class Task < ApplicationRecord

  belongs_to :user
  has_many :articles

  enum status: {未着手: 0, 着手不可: 1, 着手中: 2, 確認中: 3, 完了済: 4}
  
end
