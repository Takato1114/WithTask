class Article < ApplicationRecord
  
  belongs_to :user
  belongs_to :task
  has_many :article_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
end
