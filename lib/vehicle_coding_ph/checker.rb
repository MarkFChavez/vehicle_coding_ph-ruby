module VehicleCodingPh
  class Checker

    def self.call(plate_no, datetime = Time.now)
      return allowed_anywhere if weekend?(datetime)
      return allowed_anywhere if not coding?(plate_no, datetime)

      allowed_areas     = []
      not_allowed_areas = []
      hour_of_the_day   = datetime.hour

      VehicleCodingPh.coding_hours_per_area.each do |hash|
        area = hash[:area]
        hours = hash[:hours]

        if hours.empty? || !hours.include?(hour_of_the_day)
          allowed_areas << area
        else
          not_allowed_areas << area
        end
      end

      Response.new(true, allowed_areas, not_allowed_areas)
    end

    def self.weekend?(datetime)
      datetime.saturday? || datetime.sunday?
    end
    private_class_method :weekend?

    def self.coding?(plate, datetime)
      last_digit = plate[-1]
      day_today = Date::DAYNAMES[datetime.wday]

      mapping = VehicleCodingPh.coding_scheme.
        find { |mapping| mapping[:day] == day_today }

      mapping[:plates].include?(last_digit)
    end
    private_class_method :coding?

    def self.allowed_anywhere
      Response.new(false, [:anywhere], [])
    end
    private_class_method :allowed_anywhere

  end
end
