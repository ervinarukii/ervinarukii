class AnimesController < ApplicationController
  before_action :set_anime, only: [:show, :edit, :update, :destroy]
  before_action :set_searching_conditions, only: :index
  
  respond_to :html

  def index
    # @animes = Anime.search (params[:keyword].present? ? params[:keyword] : '*'),
    #   fields: [{ title: :word_middle }],
    #   where: @condition,
    #   order: { start_aired: "desc" },
    #   page: params[:page],
    #   per_page: 18
    @animes = Anime.page(params[:page]).per(18)

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

  def autocomplete
    render json: Anime.search(params[:query], fields: [{title: :word_middle}], limit: 10).map(&:title)
  end

  def download
    video = Video.find(params[:id])
    send_file video.file.path
  end

  private

    def set_anime
      @anime = Anime.friendly.find(params[:id])
    end

    def anime_params
      params.require(:anime).permit(:title, :description, :episodes, :status, :start_aired, :end_aired, :producer_id, :image, :duration) #, videos_attributes: [:id, :title, :description, :file, :_destroy])
    end

    def set_searching_conditions
      @condition = {}
      @condition[:status] = params[:status] if params[:status].present?
      @condition[:genres] = params[:genre] if params[:genre].present?
      @condition[:producer] = params[:producer] if params[:producer].present?
      @condition[:start_aired]= {gte: params[:gte].to_date} if params[:gte].present?
      @condition[:end_aired]= {lte: params[:lte].to_date} if params[:lte].present?
    end
end
