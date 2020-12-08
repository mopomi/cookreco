class UsersController < ApplicationController   
  before_action :move_to_index, only: :show

  def show
    user = User.find(params[:id])
    @name = current_user.name
    @recipes =current_user.recipes.order('created_at DESC')
  end

  private
    def move_to_index
     @user = User.find(params[:id])
      unless @user == current_user
      redirect_to root_path
      end
    end
end