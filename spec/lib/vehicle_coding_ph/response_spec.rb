require "spec_helper"

module VehicleCodingPh
  RSpec.describe Response do

    it "can set `coding`, `allowed`, and `not_allowed` attributes" do
      response = described_class.new(true, ["hello", "world"], ["hey", "there"])

      expect(response.coding).to eq true
      expect(response.allowed).to eq ["hello", "world"]
      expect(response.not_allowed).to eq ["hey", "there"]
    end

  end
end
