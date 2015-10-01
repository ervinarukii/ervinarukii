class HomeController < ApplicationController
  
  def index
    @animes_active = Anime.order(start_aired: :desc).take(3)
    @animes = Anime.order(start_aired: :desc).values_at(3, 4, 5)
    render layout: false
  end

  
end
