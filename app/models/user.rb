class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :codes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :active_relationships, class_name:"Relationship",foreign_key:"follower_id",dependent: :destroy

  attachment :profile_image
end
 has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy