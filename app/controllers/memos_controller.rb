class MemosController < ApplicationController
  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to recipe_path(@memo.recipe)
    else
      @recipe = @memo.recipe
      @memos = @recipe.memos
      render 'recipes/show'
    end
  end

  private

  def memo_params
    params.require(:memo).permit(:text).merge(user_id: current_user.id, recipe_id: params[:recipe_id])
  end
end
