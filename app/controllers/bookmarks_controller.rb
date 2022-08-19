class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[destroy]

  def index
    @bookmarks = policy_scope(Bookmark)
  end

  def create
    @cloth = Cloth.find(params[:cloth_id])
    @bookmark = @cloth.bookmarks.build(user_id: current_user.id)
    authorize @bookmark
    @bookmark.save
  end

  def destroy
    @cloth = @bookmark.cloth
    @bookmark.destroy
    redirect_to bookmarks_path, status: :see_other, notice: "Bookmark was successfully removed."
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end
end
