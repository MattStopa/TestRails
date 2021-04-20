class HomeController < ApplicationController
  def nutrient
    @food = Food.where(slug: home_params['slug']).first
  end

  def home_params
    params.permit(:slug)
  end

end