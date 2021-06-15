class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(recruitment_id: params[:recruitment_id])
    @like.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @recruitment = Recruitment.find(params[:recruitment_id])
    @like = Like.find_by(recruitment_id: @recruitment.id, user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
