class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search, :genre]
  before_action :move_to_index, only: [:edit, :destroy ]

  def index
    @recipes = Recipe.includes(:user).order('created_at DESC')
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @memo = Memo.new
    @memos = @recipe.memos.includes(:user)
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
       redirect_to recipe_path
    else
      render :edit
    end
  end
  
  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to root_path
  end

  def search
    @recipes = Recipe.search(params[:keyword])
  end

  def genre
    @recipe = Recipe.find_by(genre_id: params[:id])
    @recipes = Recipe.where(genre_id: params[:id]).order('created_at DESC')
    if @recipe
    else
    redirect_to action: :index
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :image, :genre_id, :point, :url).merge(user_id: current_user.id)
  end

  def move_to_index
    @recipe = Recipe.find(params[:id])
    unless @recipe.user == current_user
    redirect_to action: :index
    end
  end
end
