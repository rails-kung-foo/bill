class InvoicesController < ApplicationController
  def show
    @invoice = CustomersBill.new(customer_bill_params).get_bill
  end

  protected

  # Permitting and restricting params for CustomersBill
  def customer_bill_params
    params.permit(:billing_file)
  end
end
