class CostumersController < ApplicationController
  before_action :set_costumer, only: [:show, :edit, :update, :destroy]

  # GET /costumers
  def index
    @costumers = Costumer.all
  end

  # GET /costumers/1
  def show
  end

  # GET /costumers/new
  def new
    @costumer = Costumer.new
  end

  # GET /costumers/1/edit
  def edit
  end

  # POST /costumers
  def create
    @costumer = Costumer.new(costumer_params)

    if @costumer.save
      redirect_to @costumer, notice: 'Costumer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /costumers/1
  def update
    if @costumer.update(costumer_params)
      redirect_to @costumer, notice: 'Costumer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /costumers/1
  def destroy
    @costumer.destroy
    redirect_to costumers_url, notice: 'Costumer was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_costumer
      @costumer = Costumer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def costumer_params
      params.require(:costumer).permit(:name, :email)
    end
end
