class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # For Drops
    @cloths = Cloth.last(5)
    # For Wishlisted
    @cloths_wishlisted = Cloth.where(brand: "Louis Vuitton").limit(3)
  end

  def contact_us
  end

  def about_us
  end
end
