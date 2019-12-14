module VehicleCodingPh
  class Response

    attr_reader :coding, :allowed_areas

    def initialize(coding, areas)
      @coding = coding
      @allowed_areas = areas
    end

  end
end
