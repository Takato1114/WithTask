class Task < ApplicationRecord

  belongs_to :user
  has_many :articles

  enum status: {Todo: 0, Doing: 1, Done: 2}

  include RankedModel
  ranks :row_order

  def self.search(search)
    if search
      Task.where(['title LIKE ?', "%#{search}%"]).rank(:row_order)
    else
      Task.where(user_id: current_user.id).rank(:row_order)
    end
  end

  def self.sort(sort)
    case sort
    when 'todo'
      return Task.where(status: 0).rank(:row_order)
    when 'done'
      return Task.where(status: 2).rank(:row_order)
    end
  end

end
