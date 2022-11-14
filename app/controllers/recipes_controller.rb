class RecipesController < ApplicationController
    before_action :authorize
    
    def index
        recipes = Recipe.all
        render json: recipes
    end

    def create
        recipe = Recipe.create(recipe_params)
        render json: recipe, status: :created
    end

private

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete, :user_id)
    end

    def authorize
        return render json: { error: "User not authorized"}, status: :unauthorized unless session.include? :user_id
    end
end
