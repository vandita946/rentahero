class SuperherosController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @superheros = Superhero.all
  end

  def show
    @superhero = Superhero.find(params[:id])
  end

  def new
    @user = current_user
    @superhero = Superhero.new
  end

  def create
    @user = current_user
    @superhero = Superhero.new(superhero_params)
    @superhero.user = @user
    if @superhero.save
      redirect_to superhero_path(@superhero)
    else
      render :new
    end
  end

  def search
    @superheros = current_user.superheros
  end

  def edit
    @superhero = Superhero.find(params[:id])
  end

  def update
    @superhero = Superhero.find(params[:id])
    @superhero.update(superhero_params)
  end

  def destroy
    @superhero = Superhero.find(params[:id])
    @superhero.destroy
  end

  private

  def superhero_params
    params.require(:superhero).permit(:name, :superpower, :description, :price, :photo)
  end
end
