require "spec_helper"

module VehicleCodingPh
  RSpec.describe Checker do

    describe ".call" do
      let(:plate) { "ABC321" }

      context "given that today is Monday" do
        before { Timecop.freeze("Dec 16, 2019 10:00:00") }

        it "is not allowed to drive" do
          allowed = [
            "Marikina",
            "Muntinlupa",
            "Taguig",
            "Pasig",
            "Paranaque",
          ]

          areas = ::VehicleCodingPh.coding_hours_per_area.map do |hash|
            hash[:area]
          end

          not_allowed = areas - allowed

          response = described_class.(plate)

          expect(response.coding).to eq true
          expect(response.allowed).to eq allowed
          expect(response.not_allowed).to eq not_allowed
        end
      end

      context "given that today is Tuesday" do
        let(:tuesday) { Date.parse("Dec 17, 2019") }

        it "is allowed to drive" do
          response = described_class.(plate, tuesday) 

          expect(response.coding).to eq false
          expect(response.allowed).to eq [:anywhere]
          expect(response.not_allowed).to eq []
        end
      end

      context "given that today is Wednesday" do
        before { Timecop.freeze("Dec 18, 2019") }

        it "is allowed to drive" do
          response = described_class.(plate) 

          expect(response.coding).to eq false
          expect(response.allowed).to eq [:anywhere]
          expect(response.not_allowed).to eq []
        end
      end

      context "given that today is Thursday" do
        before { Timecop.freeze("Dec 19, 2019") }

        it "is allowed to drive" do
          response = described_class.(plate) 

          expect(response.coding).to eq false
          expect(response.allowed).to eq [:anywhere]
          expect(response.not_allowed).to eq []
        end
      end

      context "given that today is Friday" do
        before { Timecop.freeze("Dec 20, 2019") }

        it "is allowed to drive" do
          response = described_class.(plate) 

          expect(response.coding).to eq false
          expect(response.allowed).to eq [:anywhere]
          expect(response.not_allowed).to eq []
        end
      end

      context "given that today is Saturday" do
        before { Timecop.freeze("Dec 21, 2019") }

        it "is allowed to drive" do
          response = described_class.(plate) 

          expect(response.coding).to eq false
          expect(response.allowed).to eq [:anywhere]
          expect(response.not_allowed).to eq []
        end
      end

      context "given that today is Sunday" do
        before { Timecop.freeze("Dec 22, 2019") }

        it "is allowed to drive" do
          response = described_class.(plate) 

          expect(response.coding).to eq false
          expect(response.allowed).to eq [:anywhere]
          expect(response.not_allowed).to eq []
        end
      end
    end

  end
end
