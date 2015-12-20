require "rails_helper"

RSpec.describe "invoices/show", :type => :view do
  let(:assigne_invoice) { assign(:invoice, CustomersBill.new.get_bill) }
  let(:assigne_invalid_invoice) { assign(:invoice, CustomersBill.new(billing_file: 'invalid.json').get_bill) }
  let(:assigne_test_json) { JSON.parse(File.read("spec/fixtures/valid_bill.json")) }


  describe "with invalid param" do
    before :each do
      assigne_invalid_invoice

      render
    end

    it "has the error text: '#{ I18n.t('layouts.invoices.something_went_wrong') }" do
      expect(rendered).to match I18n.t('layouts.invoices.something_went_wrong')
    end
  end

  describe "with valid resource" do
    # this file should be the same with the test file on resource server
    @test_file = JSON.parse(File.read("spec/fixtures/valid_bill.json"))

    before :each do
      assigne_invoice
      assign(:invoice_json, JSON.parse(assigne_invoice.body))

      render
    end

    it "has the text: 'Your bill for the period: 26/01/2015 - 25/02/2015'" do
      expect(rendered).to match 'Your bill for the period: 26/01/2015 - 25/02/2015'
    end

    %w(£136.03 £71.40 £59.64 £24.97).each do |amount|
      it "has the amount: '#{ amount }'" do
        expect(rendered).to match amount
      end
    end

    # We scaning for the class glyphicon-phone-alt and count it to compare it with the test file
    it "has the right quantity of calls made: #{ @test_file['callCharges']['calls'].count }" do
      assigne_test_json
      expect(rendered.scan(/glyphicon-phone-alt/).count).to eq assigne_test_json['callCharges']['calls'].count
    end

    # We gather all available titles from the test file and compare it with the view
    # Checks for titles of subscription
    @test_file['package']['subscriptions'].map { |item| item['name'] }.each do |package_name|
      it "has the Package name: #{ package_name }" do
        expect(rendered).to match CGI.escapeHTML(package_name)
      end
    end

    # We gather all available titles from the test file and compare it with the view
    # Checks for titles of skyStore
    @test_file['skyStore'].reject{ |item| item == 'total' }.values.flatten.map{ |item| item['title'] }
    .each do |title|
      it "has the SkyStore title: #{ title }" do
        expect(rendered).to match CGI.escapeHTML(title)
      end
    end
  end
end
