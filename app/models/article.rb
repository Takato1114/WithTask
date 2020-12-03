class Article < ApplicationRecord

  belongs_to :user
  belongs_to :task
  has_many :article_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :article_tag_relations, dependent: :destroy
  has_many :tags, through: :article_tag_relations

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def save_tags(tag_list)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - tag_list
    new_tags = tag_list - current_tags

    # Destroy old taggings:
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name:old_name)
    end

    # Create new taggings:
    new_tags.each do |new_name|
      article_tag = Tag.find_or_create_by(tag_name:new_name)
      self.tags << article_tag
    end
    # tag_list.each do |tag|
    #   unless find_tag = Tag.find_by(tag_name: tag.downcase)
    #     begin
    #       self.tags.create!(tag_name: tag)
    #     rescue
    #       nil
    #     end
    #   else
    #     ArticleTagRelation.create!(article_id: self.id, tag_id: find_tag.id)
    #   end
    # end
  end

  def self.search(search)
    if search
      Article.where(['title LIKE ?', "%#{search}%"])
    else
      Article.all
    end
  end

end
