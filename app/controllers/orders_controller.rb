class OrdersController < ApplicationController
# new is always the page that we see

def show
  @order = Order.find(params[:id])
end


def new
  @order = Order.new
  @order.add_from_cart(@current_cart)
end

def create
  # create is the action that creates info to the database

  @order = Order.new(form_params)
  @order.add_from_cart(@current_cart)

  if @order.save_and_charge
    reset_session

    flash[:success] = "Order completed"

    OrderMailer.receipt(@order).deliver_now

    redirect_to order_path(@order)
  else
    render "new"
  end
end

def form_params
  params.require(:order).permit(:first_name, :last_name, :email, :address_1, :address_2, :city, :country, :postal_code, :stripe_token)
end

end
