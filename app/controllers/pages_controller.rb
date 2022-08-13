class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # For Drops
    @cloths = Cloth.all.limit(3)
    # For Wishlisted
    @cloths_wishlisted = Cloth.where(brand: "Louis Vuitton")
  end
end
