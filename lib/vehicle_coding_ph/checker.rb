module VehicleCodingPh
  class Checker

    def self.call(plate_no, date = Date.today)
      return true if weekend?(date)

      last_digit = plate_no[-1]
      day_today = Date::DAYNAMES[date.cwday]

      mapping = VehicleCodingPh::PLATE_TO_DAY_MAPPING.
        select { |day, digits| day == day_today }

      !mapping[day_today].include?(last_digit) 
    end

    def self.weekend?(date)
      date.saturday? || date.sunday?
    end
    private_class_method :weekend?

  end
end
