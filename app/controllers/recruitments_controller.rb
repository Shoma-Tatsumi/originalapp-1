# frozen_string_literal: true

class RecruitmentsController < ApplicationController
  before_action :set_recruitment, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new]
  before_action :move_to_index, except: %i[index show]
  

  def index
    @prefecture_id = params[:prefecture_id].to_i
    @recruitments = Recruitment.where(prefecture_id: @prefecture_id).page(params[:page]).per(5).order('event_date DESC')
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
    @comment = Comment.new
    @comments = @recruitment.comments.includes(:user)
    @like = Like.new
  end

  def edit; end

  def update
    if @recruitment.update(recruitment_params)
      redirect_to prefecture_recruitment_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to prefecture_recruitments_path if @recruitment.destroy
  end

  private

  def recruitment_params
    params.require(:recruitment).permit(:event_date, :start_time, :end_time, :place, :number_of_people, :category_id, :description).merge(
      user_id: current_user.id, prefecture_id: params[:prefecture_id]
    )
  end

  def set_recruitment
    @recruitment = Recruitment.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
