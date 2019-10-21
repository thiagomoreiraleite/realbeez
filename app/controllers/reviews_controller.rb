class ReviewsController < ApplicationController
  def new
    authorize @review = Review.new
    @agent = Agent.find(params[:agent_id])
  end

  def create
    authorize @review = Review.new(review_params)
    @review.user = current_user
    @agent = Agent.find(params[:agent_id])
    @review.agent = @agent
    if @review.save
      redirect_to profile_path(@agent.user)
    else
      flash[:alert] = "Vous avez déja publié un commentaire"
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
