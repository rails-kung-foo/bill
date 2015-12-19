module InvoicesHelper
  def display_bill_period
    t('layouts.invoices.bill_details',
      from: ltime(@invoice_json['statement']['period']['from'], format: :date),
      to: ltime(@invoice_json['statement']['period']['to'], format: :date))
  end
end
