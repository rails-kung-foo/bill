require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do
  describe "#display_page_title" do
    it "displays for the controller the page titel: 'Test Page'" do
      expect(helper.display_page_title).to eq 'Test Page'
    end
  end

  describe "#link_to_root_logo" do
    it "it has the string: 'Sky Logo'" do
      expect(helper.link_to_root_logo).to match 'Sky Logo'
    end

    it 'it has a link to root page: href="/"' do
      expect(helper.link_to_root_logo).to match 'href="/"'
    end
  end

  describe "#ltime" do
    context "with invalid argument" do
      ['', nil, false].each do |invalid_value|
        it "ltime(#{ invalid_value ==  '' ? "''" : invalid_value.class.to_s.sub('Class', '') }) returns nil: nil" do
          expect(helper.ltime(invalid_value)).to be_nil
        end
      end
    end

    context "with valid argument" do
      before :each do
        @date = '2015-12-20'
        @time_string = '2015-12-20 10:30:30 +0000'
        @time_new = Time.parse('2015-12-20 10:30:30 +0000')
      end

      it "ltime('2015-12-20', format: :date) returns date: '20/12/2015'" do
        expect(helper.ltime(@date, format: :date)).to eq '20/12/2015'
      end

      it "ltime('2015-12-20 10:30:30 +0000', format: :time) returns date: '10:30'" do
        expect(helper.ltime(@time_string, format: :time)).to eq '10:30'
      end

      it "ltime(Time.parse('2015-12-20 10:30:30 +0000'), format: :datetime) returns date: '20/12/2015 10:30'" do
        expect(helper.ltime(@time_new, format: :datetime)).to eq '20/12/2015 10:30'
      end
    end



  end
end
