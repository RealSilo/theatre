require 'rails_helper'

describe ExecutesPaypalPayment, :vcr, :aggregate_failures do
  describe 'successful credit card purchase' do
    let(:ticket_1) do
      instance_spy(
        Ticket, 
        status: 'pending',
        price: Money.new(1500), id: 1
      )
    end
    let(:ticket_2) do
      instance_spy(
        Ticket,
        status: 'pending',
        price: Money.new(1500), id: 2)
    end
    let(:ticket_3) do
      instance_spy(
        Ticket,
        status: 'unsold',
        id: 3
      )
    end
    let(:payment) { instance_spy(Payment, tickets: [ticket_1, ticket_2]) }
    let(:paypal_payment) { instance_spy(PaypalPayment, execute: true) }
    let(:user) do
      instance_double(
        User,
        id: 5,
        tickets_in_cart: [ticket_1, ticket_2]
      )
    end
    let(:workflow) do
      ExecutesPaypalPayment.new(
        payment_id: "PAYMENTID",
        token: "TOKEN",
        payer_id: "PAYER_ID"
      )
    end

    before(:example) do
      allow(workflow).to receive(:find_payment).and_return(payment)
      allow(workflow).to receive(:paypal_payment).and_return(paypal_payment)
      workflow.run
    end

    it "updates the ticket status" do
      expect(ticket_1).to have_received(:purchased!)
      expect(ticket_2).to have_received(:purchased!)
      expect(ticket_3).not_to have_received(:purchased!)
      expect(payment).to have_received(:succeeded!)
      expect(paypal_payment).to have_received(:execute)
      expect(workflow.success).to be_truthy
    end
  end
end
