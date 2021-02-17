class OrdersController < ApplicationController
  def new
      @stripe_amount = (@amount * 100).to_i
      @user = User.first
      @event = Event.first
      @amount = @pevent.price
  end

  def create
        # Before the rescue, at the beginning of the method
      @stripe_amount = (@amount * 100).to_i
      @user = User.first
      @event = Event.first
      @amount = @event.price

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
