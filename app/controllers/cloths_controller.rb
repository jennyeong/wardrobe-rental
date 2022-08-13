class ClothsController < ApplicationController
  before_action :set_cloth, only: %i[show edit update destroy]
  def index
    # @cloths = Cloth.all
    @cloths = policy_scope(Cloth)
  end

  def show
    authorize @cloth
  end

  def new
    @cloth = Cloth.new
    authorize @cloth
  end

  def create
    @cloth = Cloth.new(cloth_params)
    @cloth.user_id = current_user.id
    authorize @cloth
    if @cloth.save
      redirect_to @cloth, notice: "Cloth was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @cloth
  end

  def update
    authorize @cloth
    if @cloth.update(cloth_params)
      redirect_to @cloth, notice: "Cloth was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @cloth
    @cloth.destroy
    redirect_to cloths_path, notice: "Restaurant was successfully destroyed."
  end

  private

  def set_cloth
    @cloth = Cloth.find(params[:id])
  end

  def cloth_params
    params.require(:cloth).permit(:title, :description, :price, :category, :color, :brand, :start_date, :end_date, photos: [])
  end
end
