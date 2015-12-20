require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the InvoiceHelper. For example:
#
# describe InvoiceHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe InvoicesHelper, type: :helper do
  let(:assigne_invoice_json) { assign(:invoice_json, JSON.parse(File.read("spec/fixtures/valid_bill.json"))) }

  describe "#display_bill_period" do
    it "returns text with bill date: 'Your bill for the period: 26/01/2015 - 25/02/2015'" do
      assigne_invoice_json
      expect(helper.display_bill_period).to eq 'Your bill for the period: 26/01/2015 - 25/02/2015'
    end
  end

  describe "#amount_to_currency" do
    it "formats the number 1234 to British currency style: '£1,234.00'" do
      expect(helper.amount_to_currency(1234)).to eq '£1,234.00'
    end

    it "formats the number 136.03 to British currency style: '£136.03'" do
      assigne_invoice_json
      expect(helper.amount_to_currency(assigne_invoice_json['total'])).to eq '£136.03'
    end
  end

  describe "#total_to_currency" do
    it "formats the total amount of bill to British currency style: '£136.03'" do
      assigne_invoice_json
      expect(helper.total_to_currency).to eq '£136.03'
    end
  end

  describe "#reject_total" do
    it "rejects the string total from array: '[\"rentals\", \"buyAndKeep\"]'" do
      assigne_invoice_json
      expect(helper.reject_total(assigne_invoice_json['skyStore'].keys)).to eq ["rentals", "buyAndKeep"]
    end
  end

  describe "#is_part_of_bill?" do
    context "with valid argument" do
      %w(package callCharges skyStore).each do |type|
        it "returns true for argument #{ type }: 'true'" do
          expect(helper.is_part_of_bill?(type)).to be true
        end
      end
    end

    context "with valid argument" do
      %w(1 nil false 'invalid').each do |type|
        it "returns false for argument #{ type }: 'false'" do
          expect(helper.is_part_of_bill?(type)).to be false
        end
      end
    end
  end
end
