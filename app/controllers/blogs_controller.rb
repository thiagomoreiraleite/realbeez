class BlogsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = policy_scope(Blog.where("statut = ?", "active")).order(date: :desc)
  end

  def show
    authorize @blog
  end

  def new
    authorize @blog = Blog.new
  end

  def create
    authorize @blog = Blog.new(blog_params)
    @blog.user = current_user
    @blog.statut = "active"
    if @blog.save
      redirect_to blog_path(@blog)
    else
      render :new
    end
  end

  def edit
    authorize @blog
  end

  def update
    authorize @blog
    if @blog.update(blog_params)
      redirect_to blog_path(@blog)
    else
      render :edit
    end
  end

  def destroy
    authorize @blog
    @blog.statut = "annulé"
    @blog.save
    redirect_to blogs_path
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(
      :photo,
      :titre,
      :date,
      :intro,
      :titre_1,
      :intro_1,
      :photo_1,
      :texte_1,
      :titre_2,
      :intro_2,
      :photo_2,
      :texte_2,
      :titre_3,
      :intro_3,
      :photo_3,
      :texte_3,
      :titre_4,
      :intro_4,
      :photo_4,
      :texte_4,
      :titre_5,
      :intro_5,
      :photo_5,
      :texte_5,
      :titre_6,
      :intro_6,
      :photo_6,
      :texte_6,
      :titre_7,
      :intro_7,
      :photo_7,
      :texte_7,
      :disclaimer
    )
  end
end
