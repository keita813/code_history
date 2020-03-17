class CodesController < ApplicationController
	
	def index
		@codes = Code.all.order(created_at: :desc)
	end

	def new
		@code = Code.new
	end

	def create
		@code = Code.new(code_params)
		@code.user_id = current_user.id
		if @code.save
			redirect_to codes_path
		else
			render :new
		end
	end

	def show
		@code = Code.find(params[:id])
	end
	def edit
		
	end
	def update
		
	end
	def destroy
		code = Code.find(params[:id])
		code.destroy
		redirect_to codes_path
	end
	private
	def code_params
		params.require(:code).permit(:title,:body)
	end
end
