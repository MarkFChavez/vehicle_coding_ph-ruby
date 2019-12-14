require "spec_helper"

module CodingPh
  RSpec.describe Runner do

    describe ".call" do
      let(:plate) { "ABC321" }

      context "given that today is Monday" do
        before { Timecop.freeze("Dec 16, 2019") }

        it "is not allowed to drive" do
          result = described_class.(plate)
          expect(result).to eq false
        end
      end

      context "given that today is Tuesday" do
        before { Timecop.freeze("Dec 17, 2019") }

        it "is allowed to drive" do
          result = described_class.(plate)
          expect(result).to eq true
        end
      end
    end

  end
end
