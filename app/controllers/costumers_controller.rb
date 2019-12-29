class CostumersController < ApplicationController
  before_action :authenticate_member!, except: [:index]
  before_action :set_costumer, only: [:show, :edit, :update, :destroy]

  # GET /costumers
  def index
    @costumers = Costumer.all
    respond_to do |format|
      format.html do
        @costumers
      end
      format.json do
        render json: @costumers
      end
    end
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

    return render(:new) unless @costumer.save

    flash_message = 'Customer created successfully'
    status = 'created'
    respond(@costumer, flash_message, status)
  end

  # PATCH/PUT /costumers/1
  def update
    return render(:edit) unless @costumer.update(costumer_params)

    render json: @costumer, status: :updated
  end

  # DELETE /costumers/1
  def destroy
    @costumer.destroy
    redirect_to costumers_url, notice: 'Costumer was successfully destroyed.'
  end

  private

  def respond(entity, flash_message, status)
    respond_to do |format|
      redirect(format, entity, flash_message)
      render_to_json(format, entity, status)
    end
  end

  def redirect(format, entity, flash_message)
    format.html do
      redirect_to entity, notice: flash_message
    end
  end

  def render_to_json(format, entity, status)
    format.json do
      render json: entity, status: status.to_sym
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_costumer
    @costumer = Costumer.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def costumer_params
    params.require(:costumer).permit(:name, :email, :address)
  end
end
