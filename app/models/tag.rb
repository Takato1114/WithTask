class Tag < ApplicationRecord

  has_many :article_tag_relations, dependent: :destroy
  has_many :articles, through: :article_tag_relations

  def downcase_tag_name
      self.tag_name.downcase!
  end
end
