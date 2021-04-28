# frozen_string_literal: true

class RecruitmentsController < ApplicationController
  def index
    @prefecture_id = params[:prefecture_id].to_i
    @recruitments = Recruitment.where(prefecture_id: @prefecture_id).page(params[:page]).per(5)
  end

  def new
    @recruitment = Recruitment.new
  end

  def create
    @recruitment = Recruitment.create(recruitment_params)
    if @recruitment.save
      redirect_to prefecture_recruitments_path
    else
      render :new
    end
  end

  def show
  end

  private

  def recruitment_params
    params.require(:recruitment).permit(:event_date, :start_time, :end_time, :place, :number_of_people, :category_id, :description).merge(
      user_id: current_user.id, prefecture_id: params[:prefecture_id]
    )
  end
end
