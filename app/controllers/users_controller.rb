class UsersController < ApplicationController
  before_action :display_user_content, only:[:show]
  def index
   if user_signed_in?
    @users = User.all
  end
  end

  def show
   if user_signed_in?
    @user = User.friendly.find(params[:id])
  end
  end

  def display_user_content
      if user_signed_in?
        @user = User.friendly.find(params[:id])
        @display_questions = @user.succours
    end
  end
end
