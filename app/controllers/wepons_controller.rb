class WeponsController < ApplicationController

  def index
    @wepons = Wepon.all
  end

  def show
    @wepon = Wepon.find_by_id(params[:id])
  end
  
  
  def create
    @wepon = Wepon.new(permitted_params)
    if @wepon.save
      flash[:success] = "Object successfully created"
      redirect_to root_path
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end

  def destroy
    @wepon = Wepon.find(permitted_params[:id])
    if @wepon.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to :show
    end
  end
  
  private

  def permitted_params
    params.require(:wepon)
    .permit(:id, :name,:description, :power_base, :power_step, :level )
  end
  
end