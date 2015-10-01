class ProducersController < ApplicationController
  before_action :set_producer, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @producers = Producer.all
    respond_with(@producers)
  end

  def show
    respond_with(@producer)
  end

  def new
    @producer = Producer.new
    respond_with(@producer)
  end

  def edit
  end

  def create
    @producer = Producer.new(producer_params)
    @producer.save
    respond_with(@producer)
  end

  def update
    @producer.update(producer_params)
    respond_with(@producer)
  end

  def destroy
    @producer.destroy
    respond_with(@producer)
  end

  private
    def set_producer
      @producer = Producer.friendly.find(params[:id])
    end

    def producer_params
      params.require(:producer).permit(:name)
    end
end
