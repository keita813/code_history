class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true, length: { in: 3..20}
  validates :email, presence: true
  validates :introduction, length: { maximum:160 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :codes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # フォローの取得
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # フォロワーの取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  #自分がフォローしてる人
  has_many :following_user, through: :follower, source: :followed
  #自分をフォローしてる人
  has_many :follower_user, through: :followed, source: :follower

  attachment :profile_image

  # ユーザーをフォローする
  def follow(user_id)
  	follower.create(followed_id: user_id)
  end
  # ユーザーのフォローを外す
  def unfollow(user_id)
  	follower.find_by(followed_id: user_id).destroy
  end
  # フォローしてたらtrueを返す
  def following?(user)
  	following_user.include?(user)
  end
end