class CatRentalRequestsController < ApplicationController

  def new
    @cat_rental_request = CatRentalRequest.new
    render :new
  end

  def create
    @cat_rental_request = CatRentalRequest.create!(request_params)
    if @cat_rental_request.save
      redirect_to cat_url(@rental_request.cat)
    else
      render :new
    end
  end

  private

  def request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date,
                   :end_date)
  end

end
