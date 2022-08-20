class ClothsController < ApplicationController
  before_action :set_cloth, only: %i[show edit update destroy]
  def index
    # @cloths = Cloth.all
    # @cloths = policy_scope(Cloth)
    @cloths = policy_scope(Cloth)
    @cloths = Cloth.all
    if params[:search_outfits].present?
      # sql_query = "title ILIKE :search_outfits"
      # @cloths = Cloth.where(sql_query, search_outfits: "%#{params[:search_outfits]}%")

      @cloths = Cloth.search_by_title_and_description(params[:search_outfits])
      # raise
      # @cloths = Cloth.where(title: params[:search_outfits])
    # else
    #   @cloths = Cloth.all
    end

    # raise
  end

  def show
    @rentee = rentee?
    authorize @cloth
    @all_cloths = Cloth.where(user_id: @cloth.user_id)
    @cloths = @all_cloths.reject { |cloth| cloth.id == @cloth.id }
    @cloths = @cloths[0..2]
  end

  def new
    @cloth = Cloth.new
    authorize @cloth
  end

  def create
    @cloth = Cloth.new(cloth_params)
    @cloth.user = current_user
    authorize @cloth
    if @cloth.save
      redirect_to cloth_path(@cloth), notice: "Cloth was successfully created."
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
      redirect_to cloth_path(@cloth), notice: "Cloth was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @cloth
    @cloth.destroy
    redirect_to cloths_path, status: :see_other, notice: "Cloth was successfully deleted."
  end

  def mycloset
    @cloths = Cloth.all
    @cloths = policy_scope(Cloth)

    # @cloths = Cloth.where(user_id: current_user.id)
    # authorize @cloths
  end

  private

  def set_cloth
    @cloth = Cloth.find(params[:id])
  end

  def cloth_params
    params.require(:cloth).permit(:title, :description, :price, :category, :size, :color, :brand, :start_date, :end_date, photos: [])
  end

  def rentee?
    @cloth.user != current_user
  end
end
