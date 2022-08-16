class CustomersController < ApplicationController
  before_action :get_customer, only: %i[index new create]
  # before_action :authenticate_user!, only: %i[index new create edit update destroy]
  before_action :authenticate_user!

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create(customer_params)

    if @customer.save
      flash[:success] = 'Create a new customer is success'
      redirect_to @customer
    else
      render :new
    end
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        docket = CustomerPdf.new(@customer, @store)
        send_data docket.render,
                  filename: "docket_#{@customer.created_at.strftime('%d/%m/%y/')}.pdf",
                  type: 'application/pdf', disposition: 'inline'
      end
    end
  end

  def edit; end

  def update
    @customer = Customer.find(get_customer)
    if @customer.update_attribute(customer_params)
      flash[:success] = 'Edit a current customer is success'
      redirect_to @customer
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_url
  end

  def check_all
    @customers = Customer.find(params[:customer_ids])

    respond_to do |format|
      format.html
      format.pdf do
        dockets = CustomersPdf.new(@customers)
        send_data dockets.render,
                  filename: 'dockets.pdf', type: 'application/pdf'
      end
    end
  end

  private

  def get_customer
    @customer = Customer.find_by(id: params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :address, :postcode, :province, :state, :phone_number)
  end
end
