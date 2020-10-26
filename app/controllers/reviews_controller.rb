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
      # ======== Create a notification ===========
      # Notification.create(recipient: @agent.user, actor: current_user, action: "rating_agent", notifiable: @review)
      # Send email
      # mail = ReviewMailer.with(review: @review).rating_agent
      # mail.deliver_now
      # ============= Create a rating ============
      @sum_ratings = @agent.reviews.inject(0) {|sum, i|  sum + i.rating }.to_f
      @nb_ratings = @agent.reviews.count.to_f
      @average_ratings = (@sum_ratings/@nb_ratings)
      @agent.user.rating = @average_ratings.to_f
      @agent.user.save
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
