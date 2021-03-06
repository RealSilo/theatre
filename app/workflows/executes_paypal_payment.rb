class ExecutesPaypalPayment
  attr_accessor :payment_id, :token, :payer_id, :payment, :success

  def initialize(payment_id:, token:, payer_id:) 
    @payment_id = payment_id
    @token = token
    @payer_id = payer_id
    @success = false
  end

  def run
    Payment.transaction do
      @payment = find_payment
      execute_ok = paypal_payment.execute(payer_id: payer_id)
      return unless execute_ok
      payment.tickets.each(&:purchased!)
      payment.succeeded!
      @success = true
    end
  end

  def find_payment
    Payment.find_by(payment_method: 'paypal', response_id: payment_id)
  end

  def paypal_payment
    @paypal_payment ||= PaypalPayment.find(payment_id)
  end
end
