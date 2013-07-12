class Recipe < ActiveRecord::Base
  attr_accessible :name, :ingredients

  has_many :recipe_ingredients
  has_many :ingredients, :through => :recipe_ingredients

  def add_ingredients_by_name(ingredients)
    ingredients.collect(&:downcase).collect(&:strip).reject(&:blank?).uniq.each do |ingredient_name|
      add_ingredient_by_name(ingredient_name)
    end
  end

  def add_ingredient_by_name(ingredient_name)
    ingredient = Ingredient.where(:name => ingredient_name).first_or_create
    self.recipe_ingredients.build(:ingredient => ingredient)
  end
end
