class Code < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy

	validates :title, presence: true, length: {minimum: 5 }
	validates :body, presence: true
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
	# コントローラーでsearchを使えるようにする為にsearchメソッドを宣言する
	# 複数のカラムで検索できるように ORを使って検索できるカラムを追加
	def self.search(search)
		if search
			Code.where(['title LIKE ? OR body LIKE ?',"%#{search}%","%#{search}%"])
		else
			render :index
		end
	end


end
