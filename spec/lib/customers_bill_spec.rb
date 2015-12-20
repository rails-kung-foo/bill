require 'rails_helper'

RSpec.describe CustomersBill do
  let(:new_customer_bill){ CustomersBill.new }
  let(:invalid_argument){ CustomersBill.new(billing_file: 'invalid.json') }
  let(:valid_bill_json){ JSON.parse(File.read("spec/fixtures/valid_bill.json")) }

  describe "Constants" do
    it "SKY_BILLING_URI has the URI: 'http://safe-plains-5453.herokuapp.com/'" do
      expect(CustomersBill::SKY_BILLING_URI.to_s).to match 'http://safe-plains-5453.herokuapp.com/'
    end
  end

  context "calling with no argument" do
    before :each do
      new_customer_bill
    end

    it "raise not an ArgumentError" do
      expect{ CustomersBill.new }.not_to raise_error(ArgumentError)
    end

    it ".billing_file has the default value: 'bill.json'" do
      expect(new_customer_bill.billing_file).to eq 'bill.json'
    end

    it "#billing_url returns sky billing URI with the default bill: http://safe-plains-5453.herokuapp.com/..." do
      expect(new_customer_bill.send(:billing_url)).to eq "http://safe-plains-5453.herokuapp.com/#{ new_customer_bill.billing_file }"
    end

    context ".get_bill" do
      it "has the status code: '200'" do
        expect(new_customer_bill.get_bill.code).to eq '200'
      end

      it "has the right bill body" do
        get_bill_json = JSON.parse(new_customer_bill.get_bill.body)
        expect(get_bill_json).to eq valid_bill_json
      end
    end
  end

  context "calling with invalid argument" do
    before :each do
      invalid_argument
    end

    it "has the status code: '404'" do
      expect(invalid_argument.get_bill.code).to eq '404'
    end

    it "has the error message included: 'Cannot GET'" do
      expect(invalid_argument.get_bill.body).to include 'Cannot GET /'
    end

    it ".billing_file has the argument as value: 'invalid.json'" do
      expect(invalid_argument.billing_file).to eq 'invalid.json'
    end
  end
end
