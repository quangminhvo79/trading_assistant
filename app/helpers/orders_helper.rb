module OrdersHelper
  def order_side_badge_klass(order)
    order.side.downcase == "long" ? "badge-success" : "badge-danger"
  end

  def order_profit(order)
    (order.takeprofit_price - order.entry_price) * order.token_amount
  end

  def order_loss(order)
    (order.entry_price - order.stoploss_price) * order.token_amount
  end
end
