require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe "Constants" do
    context "BILL_ITEM_TYPES" do
      it "returns an array of sky product types: ['skyStore', 'package', 'callCharges']." do
        expect(Invoice::BILL_ITEM_TYPES).to match_array %w(skyStore package callCharges)
      end
    end
  end
end
