module VehicleCodingPh
  class Checker

    def self.call(plate_no)
      today = Date.today

      return true if weekend?(today)

      last_digit = plate_no[-1]
      today = Date::DAYNAMES[today.cwday]

      mapping = VehicleCodingPh::PLATE_TO_DAY_MAPPING.
        select { |day, _| day == today }

      !mapping[today].include?(last_digit) 
    end

    def self.weekend?(date)
      date.saturday? || date.sunday?
    end
    private_class_method :weekend?

  end
end
