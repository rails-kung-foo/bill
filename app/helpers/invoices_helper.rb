module InvoicesHelper

  # Display billing date details
  def display_bill_period
    t('layouts.invoices.bill_details',
      from: ltime(@invoice_json['statement']['period']['from'], format: :date),
      to: ltime(@invoice_json['statement']['period']['to'], format: :date))
  end

  # Returns billing total amount
  def total_to_currency
    number_to_currency(@invoice_json['total'], { unit: '£' })
  end
end
