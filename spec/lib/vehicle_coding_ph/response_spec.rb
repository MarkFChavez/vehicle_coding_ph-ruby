require "spec_helper"

module VehicleCodingPh
  RSpec.describe Response do

    it "can set `coding` and `allowed_areas` attributes" do
      response = described_class.new(true, ["hello", "world"])

      expect(response.coding).to eq true
      expect(response.allowed_areas).to eq ["hello", "world"]
    end

  end
end
