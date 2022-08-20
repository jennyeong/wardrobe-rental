class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # For Drops
    @cloths = Cloth.where(rented: false).last(5)
    # For Wishlisted
    # @cloths_wishlisted = Cloth.where(rented: false, brand: "Louis Vuitton").limit(3)
    @cloths_wishlisted = []
    Bookmark.all.each do |bookmark|
      @cloths_wishlisted << bookmark.cloth if bookmark.cloth.rented == false
    end
    @cloths_wishlisted = @cloths_wishlisted.first(5)
  end

  def contact_us
  end

  def about_us
  end
end
