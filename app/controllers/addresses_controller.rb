class AddressesController < ApplicationController

  def index
    @addresses = current_user.addresses
  end

  def new
    @address = Address.new
  end

  def create
    user_id = current_user.id
    @address = Address.new address_params
    @address.user_id = user_id
    if @address.save
      redirect_to addresses_path
    else
      render :new
    end
  end

  def edit
    @address = Address.find params[:id]
  end

  def update
    @address = Address.find params[:id]
    if @address.update address_params
      redirect_to addresses_path
    else
      render :edit
    end
  end

  private
  def address_params
    params.require(:address).permit(:phone, :shipping_name, :shipping_address)
  end
end
