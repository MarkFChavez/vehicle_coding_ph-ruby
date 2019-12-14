module VehicleCodingPh
  class Checker

    def self.call(plate_no, datetime = Time.now)
      return allowed_anywhere if weekend?(datetime)
      return allowed_anywhere if not coding?(plate_no, datetime)

      hour_of_the_day = datetime.hour

      allowed_areas = VehicleCodingPh::AREA_TO_HOUR_MAPPING.reduce([]) do |areas, mapping|
        areas ||= []

        name_of_area = mapping[0]
        coding_hours = mapping[1]

        if coding_hours.empty? || !coding_hours.include?(hour_of_the_day)
          areas << name_of_area
        end

        areas
      end

      Response.new(true, allowed_areas)
    end

    def self.weekend?(datetime)
      datetime.saturday? || datetime.sunday?
    end
    private_class_method :weekend?

    def self.coding?(plate, datetime)
      last_digit = plate[-1]
      day_today = Date::DAYNAMES[datetime.wday]

      mapping = VehicleCodingPh::PLATE_TO_DAY_MAPPING.
        select { |day, digits| day == day_today }

      mapping[day_today].include?(last_digit)
    end
    private_class_method :coding?

    def self.allowed_anywhere
      Response.new(false, [:anywhere])
    end
    private_class_method :allowed_anywhere

  end
end
