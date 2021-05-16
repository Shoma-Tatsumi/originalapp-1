# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @recruitment = Recruitment.find(params[:recruitment_id])
    @comment = Comment.create(comment_params)
    @comments = @recruitment.comments.includes(:user)
    if @comment.save
      redirect_to "/prefectures/#{@comment.recruitment.prefecture_id}/recruitments/#{@comment.recruitment.id}"
    else
      render 'recruitments/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, recruitment_id: params[:recruitment_id])
  end
end
