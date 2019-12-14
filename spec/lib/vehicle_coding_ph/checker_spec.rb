require "spec_helper"

module VehicleCodingPh
  RSpec.describe Checker do

    describe ".call" do
      let(:plate) { "ABC321" }

      context "given that today is Monday" do
        before { Timecop.freeze("Dec 16, 2019 10:00:00") }

        it "is not allowed to drive" do
          expected_areas = [
            "Marikina",
            "Muntinlupa",
            "Taguig",
            "Pasig",
            "Paranaque",
          ]

          response = described_class.(plate)

          expect(response.coding).to eq true
          expect(response.allowed_areas).to eq expected_areas
        end
      end

      context "given that today is Tuesday" do
        let(:tuesday) { Date.parse("Dec 17, 2019") }

        it "is allowed to drive" do
          response = described_class.(plate, tuesday) 

          expect(response.coding).to eq false
          expect(response.allowed_areas).to eq [:anywhere]
        end
      end

      context "given that today is Wednesday" do
        before { Timecop.freeze("Dec 18, 2019") }

        it "is allowed to drive" do
          response = described_class.(plate) 

          expect(response.coding).to eq false
          expect(response.allowed_areas).to eq [:anywhere]
        end
      end

      context "given that today is Thursday" do
        before { Timecop.freeze("Dec 19, 2019") }

        it "is allowed to drive" do
          response = described_class.(plate) 

          expect(response.coding).to eq false
          expect(response.allowed_areas).to eq [:anywhere]
        end
      end

      context "given that today is Friday" do
        before { Timecop.freeze("Dec 20, 2019") }

        it "is allowed to drive" do
          response = described_class.(plate) 

          expect(response.coding).to eq false
          expect(response.allowed_areas).to eq [:anywhere]
        end
      end

      context "given that today is Saturday" do
        before { Timecop.freeze("Dec 21, 2019") }

        it "is allowed to drive" do
          response = described_class.(plate) 

          expect(response.coding).to eq false
          expect(response.allowed_areas).to eq [:anywhere]
        end
      end

      context "given that today is Sunday" do
        before { Timecop.freeze("Dec 22, 2019") }

        it "is allowed to drive" do
          response = described_class.(plate) 

          expect(response.coding).to eq false
          expect(response.allowed_areas).to eq [:anywhere]
        end
      end
    end

  end
end
