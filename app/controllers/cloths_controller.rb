class ClothsController < ApplicationController
  before_action :set_cloth, only: %i[show edit update destroy]
  def index
    @cloths = Cloth.all
  end

  def show
  end

  def new
    @cloth = Cloth.new
  end

  def create
    @cloth = Cloth.new(cloth_params)
    if @cloth.save
      redirect_to @cloth, notice: "Cloth was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update

  end

  def destroy

  end

  private

  def set_cloth
    @cloth = Cloth.find(params[:id])
  end

  def cloth_params
    params.require(:cloth).permit(:title, :description, :category, :color, :brand, :start_date, :end_date)
  end
end
