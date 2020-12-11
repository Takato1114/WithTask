class Task < ApplicationRecord

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  belongs_to :user

  enum status: {Todo: 0, Done: 1}

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
      return Task.where(status: 1).rank(:row_order)
    end
  end

end
