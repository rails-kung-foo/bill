module InvoicesHelper

  # Display billing date details
  def display_bill_period
    t('layouts.invoices.bill_details',
      from: ltime(@invoice_json['statement']['period']['from'], format: :date),
      to: ltime(@invoice_json['statement']['period']['to'], format: :date))
  end

  # Formats billing total amount
  def total_to_currency
    number_to_currency(@invoice_json['total'])
  end

  # Formats amount to currency
  def amount_to_currency(number)
    number_to_currency(number.to_i, { unit: '£' })
  end

  # Removes the attribute total from a product. Used for sky store partial
  def reject_total(array)
    array.reject{ |string| string == 'total' }
  end

  # Check if string/key is part of sky product type
  def is_part_of_bill?(key)
    Invoice::BILL_ITEM_TYPES.include?(key)
  end
end
