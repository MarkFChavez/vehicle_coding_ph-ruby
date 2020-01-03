module VehicleCodingPh
  class Response

    attr_reader :coding, :allowed, :not_allowed

    def initialize(coding, allowed, not_allowed)
      @coding = coding
      @allowed = allowed
      @not_allowed = not_allowed
    end

  end
end
