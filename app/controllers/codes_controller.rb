class CodesController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@codes = Code.page(params[:page]).reverse_order
	end

	def new
		@code = Code.new
	end

	def create
		@code = Code.new(code_params)
		@code.user_id = current_user.id
		if @code.save
			flash[:notice] ="投稿が出来ました。"
			redirect_to code_path(@code.id)
		else
			render :new
		end
	end

	def show
		@code = Code.find(params[:id])
		@user = @code.user
	end

	def edit
		@code = Code.find(params[:id])
		if @code.user != current_user
			redirect_to code_path(@code)
		end
	end

	def update
		@code = Code.find(params[:id])
		if @code.update(code_params)
			flash[:notice] ="投稿の編集が出来ました。"
			redirect_to code_path(@code)
		else
			render "edit"
		end

	end

	def destroy
		code = Code.find(params[:id])
		code.destroy
		flash[:notice] ="投稿の削除が出来ました。"
		redirect_to codes_path
	end
	# routes.rbの'codes#search'の対応するメソッド
	def search
		@codes = Code.search(params[:search])
	end

	private
	def code_params
		params.require(:code).permit(:title,:body)
	end
end
