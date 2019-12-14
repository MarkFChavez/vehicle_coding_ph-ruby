module CodingPh
  class Runner

    PLATE_TO_DAY_MAPPING = {
      "Monday"    => ["1", "2"],
      "Tuesday"   => ["3", "4"],
      "Wednesday" => ["5", "6"],
      "Thursday"  => ["7", "8"],
      "Friday"    => ["9", "0"],
      "Saturday"  => [],
      "Sunday"    => [],
    }

    def self.call(plate_no)
      today = Date.today

      return true if weekend?(today)

      last_digit = plate_no[-1]
      today = Date::DAYNAMES[today.cwday]

      mapping = PLATE_TO_DAY_MAPPING.select do |day, digits|
        day == today
      end

      !mapping[today].include?(last_digit) 
    end

    def self.weekend?(date)
      date.saturday? || date.sunday?
    end
    private_class_method :weekend?

  end
end
