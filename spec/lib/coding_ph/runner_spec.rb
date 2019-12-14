require "spec_helper"

module CodingPh
  RSpec.describe Runner do

    describe ".call" do
      let(:plate) { "ABC321" }

      context "given that today is Monday" do
        before { Timecop.freeze("Dec 16, 2019") }

        it "is not allowed to drive" do
          expect(described_class.(plate)).to eq false
        end
      end

      context "given that today is Tuesday" do
        before { Timecop.freeze("Dec 17, 2019") }

        it "is allowed to drive" do
          expect(described_class.(plate)).to eq true
        end
      end

      context "given that today is Wednesday" do
        before { Timecop.freeze("Dec 18, 2019") }

        it "is allowed to drive" do
          expect(described_class.(plate)).to eq true
        end
      end

      context "given that today is Thursday" do
        before { Timecop.freeze("Dec 19, 2019") }

        it "is allowed to drive" do
          expect(described_class.(plate)).to eq true
        end
      end

      context "given that today is Friday" do
        before { Timecop.freeze("Dec 20, 2019") }

        it "is allowed to drive" do
          expect(described_class.(plate)).to eq true
        end
      end

      context "given that today is Saturday" do
        before { Timecop.freeze("Dec 21, 2019") }

        it "is allowed to drive" do
          expect(described_class.(plate)).to eq true
        end
      end

      context "given that today is Sunday" do
        before { Timecop.freeze("Dec 22, 2019") }

        it "is allowed to drive" do
          expect(described_class.(plate)).to eq true
        end
      end
    end

  end
end
