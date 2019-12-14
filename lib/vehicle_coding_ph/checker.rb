module VehicleCodingPh
  class Checker

    def self.call(plate_no, date = Date.today)
      return allowed_anywhere if not coding?(plate_no, date)

      VehicleCodingPh::AREA_TO_HOUR_MAPPING.reduce({}) do |area, coding_hours|
      end
    end

    # def self.weekend?(date)
    #   date.saturday? || date.sunday?
    # end
    # private_class_method :weekend?

    def self.coding?(plate, date)
      last_digit = plate[-1]
      day_today = Date::DAYNAMES[date.cwday]

      mapping = VehicleCodingPh::PLATE_TO_DAY_MAPPING.
        select { |day, digits| day == day_today }

      mapping[day_today].include?(last_digit)
    end
    private_class_method :coding?

    def self.allowed_anywhere
      {
        coding: false,
        areas_allowed: [:anywhere],
      }
    end
    private_class_method :allowed_anywhere

  end
end
