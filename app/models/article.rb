class Article < ApplicationRecord

  validates :title, presence: true
  validates :explanation, presence: true

  belongs_to :user
  has_many :article_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :article_tag_relations, dependent: :destroy
  has_many :tags, through: :article_tag_relations

  # いいね機能
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def save_tags(tag_list)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - tag_list
    new_tags = tag_list - current_tags

    # 古いタグを削除
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name:old_name)
      Tag.find_by(tag_name: old_name).destroy
    end

    # 新しいタグを追加
    new_tags.each do |new_name|
      article_tag = Tag.find_or_create_by(tag_name:new_name)
      self.tags << article_tag
    end

  end

  # 検索機能
  def self.search(search)
    if search
      Article.where(['title LIKE ?', "%#{search}%"])
    else
      Article.all
    end
  end

  # ソート機能
  def self.sort(sort)
    case sort
    when 'new'
      return all.order(created_at: :DESC)
    when 'old'
      return all.order(created_at: :ASC)
    when 'likes'
      return find(Favorite.group(:article_id).order(Arel.sql('count(article_id) desc')).pluck(:article_id))
    end
  end

end
