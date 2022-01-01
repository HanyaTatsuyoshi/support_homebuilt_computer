class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :correct_user, only: [:show]
  
  def show
    @user = User.find(params[:id])
    @customs = @user.customs.paginate(page: params[:page])
  end
  
  private
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user && @user == current_user
    end
end
