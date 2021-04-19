# frozen_string_literal: true

class UsersController < ApplicationController
  def show; end

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
    params.require(:user).permit(:nickname, :email, :age, :years_of_experience_id, :introduction)
  end
end
