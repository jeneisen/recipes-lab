class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.create
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    #raise params
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.name = params[:name]
    @recipe.add_ingredients_by_name(params[:ingredient])

    @recipe.save
    redirect_to @recipe
  end

    def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:cookbook])
        format.html { redirect_to @recipe, notice: 'Cookbook was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end
end
