class CatRentalRequestsController < ApplicationController

  def new
    @cats = Cat.all
    byebug
    @cat_rental_request = CatRentalRequest.new
    render :new
  end

  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
    if @cat_rental_request.save
      redirect_to cats_url
    else
      render :new
    end
  end

  private
  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:start_date, :end_date, :cat_id)
  end

end
