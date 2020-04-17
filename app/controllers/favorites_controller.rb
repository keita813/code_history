class FavoritesController < ApplicationController
	before_action :authenticate_user!
	
	def create
		@code = Code.find(params[:code_id])
		favorite = current_user.favorites.new(code_id: @code.id)
		favorite.save
		# 前の画面に戻る
		# redirect_to request.referer
	end

	def destroy
		@code = Code.find(params[:code_id])
		favorite = current_user.favorites.find_by(code_id: @code.id)
		favorite.destroy
		# 前の画面に戻る
		# redirect_to request.referer
	end
end
