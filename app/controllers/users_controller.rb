class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@codes = @user.codes
  end
end
