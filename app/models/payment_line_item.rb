class PaymentLineItem < ApplicationRecord
  belongs_to :payment
  belongs_to :buyable, polymorphic: true

  monetize :price_cents

  delegate :performance, to: :buyable, allow_nil: true
  delegate :name, :event, to: :performance, allow_nil: true
  delegate :id, to: :event, prefix: true, allow_nil: true
end
