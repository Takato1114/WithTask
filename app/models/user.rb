class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true

  has_many :tasks
  has_many :articles
  has_many :article_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  # 退会フラグ
  # def active_for_authentication?
  #   super && (self.quit_flag == false)
  # end

  # ゲストログイン時のユーザー情報生成
  def self.guest
    find_or_create_by!(nickname: 'ゲストユーザー', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

end
