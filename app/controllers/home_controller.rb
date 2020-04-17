class HomeController < ApplicationController
	def index
		# ページネーション
		@codes = Code.page(params[:page]).reverse_order
	end

	def about
	end
end
