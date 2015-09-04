class AnimesController < ApplicationController
  before_action :set_anime, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @animes = Anime.all
    respond_with(@animes)
  end

  def show
    respond_with(@anime)
  end

  def new
    @anime = Anime.new
    respond_with(@anime)
  end

  def edit
  end

  def create
    @anime = Anime.new(anime_params)
    @anime.save
    respond_with(@anime)
  end

  def update
    @anime.update(anime_params)
    respond_with(@anime)
  end

  def destroy
    @anime.destroy
    respond_with(@anime)
  end

  private
    def set_anime
      @anime = Anime.find(params[:id])
    end

    def anime_params
      params.require(:anime).permit(:title, :description, :episodes, :status, :start_aired, :end_aired, :producer_id, :duration, :user_id)
    end
end
