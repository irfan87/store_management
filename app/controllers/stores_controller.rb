class StoresController < ApplicationController
  before_action :get_store, except: [:index, :new, :create]
  before_action :authenticate_user!
  
  def index
  	@stores = Store.all
  end

  def new
  	@store = Store.new
  end

  def create
  	@store = Store.create(store_params)

  	if @store.save
  		redirect_to @store, notice: 'You have created a new store'
  	else
  		render :new
  	end
  end

  def show
  end

  def edit
  end

  def update
  	if @store.update_attributes(store_params)
  		redirect_to @store, notice: 'You have updated your current store'
  	else
  		render :edit
  	end
  end

  def destroy
  	@store.destroy
  	redirect_to stores_url
  end

  private

  def get_store
  	@store = Store.find_by(id: params[:id])
  end

  def store_params
  	params.require(:store).permit(:name, :address, :postcode, :province, :state, :phone_number)
  end
end
