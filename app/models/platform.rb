# frozen_string_literal: true

class Platform < ApplicationRecord
  has_many :tokens, dependent: :nullify

  validates :name, presence: true, uniqueness: true

  before_validation :downcase_name

  def orders
    Order.where(token_id: tokens.pluck(:id))
  end

  private

  def downcase_name
    self.name = name.downcase if name.present?
  end
end
