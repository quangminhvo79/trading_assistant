# frozen_string_literal: true

class Token < ApplicationRecord
  PERCENT = "percent"
  FIXED = "fixed"
  VOLUME_TYPES = [ PERCENT, FIXED ].freeze

  belongs_to :platform
  has_many :orders, dependent: :nullify

  validates :symbol_name, :initial_balances, :current_balances, presence: true
  validates :volume_by_percent, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :volume_by_value, numericality: { greater_than_or_equal_to: 0 }, presence: true
  validates :volume_type, inclusion: { in: VOLUME_TYPES }, presence: true

  scope :enabled, -> { where(enabled: true) }
end
