class UsersController < ApplicationController
  before_action :display_user_content, only:[:show]
  def index
    @users = User.all
  end

  def show
    @user = User.friendly.find(params[:id])
  end

  def display_user_content
      @user = User.friendly.find(params[:id])
      @display_questions = @user.succours
  end
end
