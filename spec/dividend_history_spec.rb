require 'spec_helper'

describe NasdaqQuery::DividendHistory do
  describe "#for_symbol" do
    let(:sym) { "aapl" }
    subject { NasdaqQuery::DividendHistory.for_symbol(sym) }
    it { should be_a Array }
    it "should have the right keys" do
      expected_keys = [:ex_eff_date, :type, :cash_amt, :declaration_date, :record_date, :payment_date]
      subject.all?{ |entry| entry.keys == expected_keys }.should be_true
    end
    it "should be the right length" do
      subject.length.should >= 32
    end
  end
end
