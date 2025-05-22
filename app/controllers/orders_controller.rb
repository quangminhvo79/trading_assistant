class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @tokens = Token.all
  end

  def create
    @order = Order.new(order_params)
    token = Token.find(params[:order][:token_id])

    if token.volume_type == "percent"
      @order.usdt_amount = token.current_balances * (token.volume_by_percent / 100.0)
      @order.token_amount = @order.usdt_amount / (@order.stoploss_price - @order.entry_price).abs
    else
      @order.usdt_amount = token.volume_by_value
      @order.token_amount = @order.usdt_amount / (@order.stoploss_price - @order.entry_price).abs
    end
    debugger
    if @order.save
      flash[:notice] = "Order created successfully."
      redirect_to orders_path
    else
      flash.now[:alert] = "Error creating order: #{@order.errors.full_messages.join(', ')}"
      @tokens = Token.all
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :entry_price,
      :stoploss_price,
      :takeprofit_price,
      :risk_reward_ratio,
      :status,
      :side,
      :token_id,
    )
  end
end
