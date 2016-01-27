class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    render :show
  end

  def create
    @cat = Cat.create!(cat_params)
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    render :edit
  end

  def update
    @cat = Cat.find_by(id: params[:id])
    @cat.update_attributes(cat_params)
    render :show
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :color, :sex, :birth_date, :description)
  end

end
