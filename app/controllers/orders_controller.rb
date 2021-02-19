class OrdersController < ApplicationController
  def new
      @stripe_amount = (@amount.to_i * 100)
      @user = User.first
      @event = Event.first
      @amount = @event.price
  end

  def create
        # Before the rescue, at the beginning of the method
      @amount = @event.price
      @stripe_amount = (@amount.to_i * 100)
      @user = User.first
      @event = Event.first

    begin
      customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      })
      charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @stripe_amount,
      description: "ticket evenement",
      currency: 'eur',
      })
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_order_path
    end
    # After the rescue, if the payment succeeded
  end
end
