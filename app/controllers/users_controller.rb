class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
  	@user = User.find(params[:id])
  	@codes = @user.codes
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
       flash[:notice] ="プロフィールの編集が出来ました。"
       redirect_to user_path(@user)
    else
      render "edit"
    end
  end

   def destroy
     user = User.find(params[:id])
     user.destroy
     redirect_to root_path
   end

   private
   def user_params
     params.require(:user).permit(:name, :introduction, :profile_image)
   end

 end
