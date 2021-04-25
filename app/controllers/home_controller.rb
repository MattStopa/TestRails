class HomeController < ApplicationController
  def nutrient
    @food = Food.where(slug: home_params['slug']).first
    @fact = home_params['fact']

    @highlighted_fact = nil
    @facts_to_show = @food.facts.select do |i|
      if(i.id == @fact.to_i)
        @highlighted_fact = i
        false
      else
        true
      end
    end


  end

  def home_params
    params.permit(:slug, :name, :fact)
  end

  def tags
    @name = home_params['name']
    @facts = Tag.where(name: @name).first.facts
  end

end