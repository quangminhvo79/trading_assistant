# frozen_string_literal: true

class Order < ApplicationRecord
  OPEN = "open"
  CLOSED = "closed"
  CANCELLED = "cancelled"
  STATUS = [ OPEN, CLOSED, CANCELLED ].freeze

  LONG = "long"
  SHORT = "short"
  ORDER_TYPES = [ LONG, SHORT ].freeze

  belongs_to :token

  validates :usdt_amount, :token_amount, :entry_price, :stoploss_price, :takeprofit_price,
            :risk_reward_ratio, :status, :side, presence: true
  validates :status, inclusion: { in: STATUS }
  validates :side, inclusion: { in: ORDER_TYPES }
end
