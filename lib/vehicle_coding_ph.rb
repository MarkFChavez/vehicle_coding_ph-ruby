require "date"
require "vehicle_coding_ph/version"
require "vehicle_coding_ph/checker"

module VehicleCodingPh
  class Error < StandardError; end

  PLATE_TO_DAY_MAPPING = {
    "Monday"    => ["1", "2"],
    "Tuesday"   => ["3", "4"],
    "Wednesday" => ["5", "6"],
    "Thursday"  => ["7", "8"],
    "Friday"    => ["9", "0"],
    "Saturday"  => [],
    "Sunday"    => [],
  }
end
