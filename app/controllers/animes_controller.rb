class AnimesController < ApplicationController
  before_action :set_anime, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!
  before_action :set_company  
  respond_to :html

  def index
    @animes = Anime.all
    respond_with(@animes)
  end

  def show
    respond_with(@anime)
  end

  def new
    @anime = @company.animes.new
    respond_with(@anime)
  end

  def edit
  end

  def create
    @anime = @company.animes.new(anime_params)
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

    def set_company
      @company = Company.find_by_host(Apartment::Tenant.current)
      # Apartment::Tenant.current.eql?(@nime)
    end

    def set_anime
      @anime = Anime.friendly.find(params[:id])
    end

    def anime_params
      params.require(:anime).permit(:title, :description, :image, :episodes, :company_id)
    end
end
