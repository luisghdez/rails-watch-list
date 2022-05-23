class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.photo.attach(list_params[:photo])
    @list.save

    redirect_to list_path(@list)
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
