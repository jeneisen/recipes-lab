class RecipeIngredient < ActiveRecord::Base
  attr_accessible :ingredient_id, :recipe_id, :ingredient

  belongs_to :ingredient
  belongs_to :recipe
end
