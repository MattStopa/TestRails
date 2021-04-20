class HomeController < ApplicationController
  def nutrient
    @food = Food.where(slug: home_params['slug']).first
  end

  def home_params
    params.permit(:slug, :name)
  end

  def tags
    @name = home_params['name']
    @facts = Tag.where(name: @name).first.facts
  end

end