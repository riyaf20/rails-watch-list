class ListsController < ApplicationController

# As a user, I can see all my movie lists
  def index
    @lists = List.all
  end

# As a user, I can see the details of a movie list
  def show
    @list = List.find(params[:id])
  end

# As a user, I can create a movie list
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
