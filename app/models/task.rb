class Task < ApplicationRecord

  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  belongs_to :user

  # ドラッグアンドドロップ機能
  # include RankedModel
  # ranks :row_order

  # 検索機能（未実装）
  # def self.search(search)
  #   if search
  #     Task.where(['title LIKE ?', "%#{search}%"]).rank(:row_order)
  #   else
  #     Task.where(user_id: current_user.id).rank(:row_order)
  #   end
  # end

  # ソート機能（未実装）
  # def self.sort(sort)
  #   case sort
  #   when 'todo'
  #     return Task.where(status: 0).rank(:row_order)
  #   when 'done'
  #     return Task.where(status: 1).rank(:row_order)
  #   end
  # end

end
