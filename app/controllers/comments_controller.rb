# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/prefectures/#{comment.recruitment.prefecture_id}/recruitments/#{comment.recruitment.id}"
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, recruitment_id: params[:recruitment_id])
  end
end
