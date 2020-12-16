class UsersController < ApplicationController
  before_action :move_to_index, only: [:show, :likes]

  def show
    user = User.find(params[:id])
    @name = current_user.name
    @recipes = current_user.recipes.order('created_at DESC')
  end

  def likes
    @name = current_user.name
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id).order('created_at DESC')
  end
  
  private

  def move_to_index
    @user = User.find(params[:id])
    redirect_to root_path unless @user == current_user
  end
end
