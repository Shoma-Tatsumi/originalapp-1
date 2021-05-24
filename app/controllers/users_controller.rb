# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[edit update]
  
  def show
    @user = User.find(params[:id])
    @recruitments = Recruitment.where(user_id: @user.id).page(params[:page]).per(5).order('event_date DESC')
  end

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:image, :nickname, :email, :age, :years_of_experience_id, :introduction)
  end
end
