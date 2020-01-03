require "date"
require "yaml"
require "active_support/core_ext/hash/indifferent_access"
require "vehicle_coding_ph/version"
require "vehicle_coding_ph/checker"
require "vehicle_coding_ph/response"

module VehicleCodingPh
  class Error < StandardError; end

  def self.coding_scheme
    file = File.join(File.dirname(__FILE__), "sources", "coding_scheme.yml")
    YAML.load_file(file).map(&:with_indifferent_access)
  end

  AREA_TO_HOUR_MAPPING = {
    "Marikina" => [],
    "Muntinlupa" => [],
    "Taguig" => [],
    "Pasig" => [7, 8, 9, 16, 17, 18, 19],
    "Makati" => [7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19],
    "Mandaluyong" => [7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20],
    "Pasay" => [7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20],
    "Las Pinas" => [7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20],
    "Paranaque" => [7, 8, 9, 16, 17, 18, 19],
    "Caloocan" => [7, 8, 9, 10, 16, 17, 18, 19],
    "Quezon City" => [7, 8, 9, 10, 16, 17, 18, 19],
    "Valenzuela" => [7, 8, 9, 10, 16, 17, 18, 19],
    "Malabon" => [7, 8, 9, 10, 16, 17, 18, 19],
    "San Juan" => [7, 8, 9, 10, 16, 17, 18, 19],
    "Navotas" => [7, 8, 9, 10, 16, 17, 18, 19],
    "Manila" => [7, 8, 9, 10, 16, 17, 18, 19],
    "Pateros" => [7, 8, 9, 10, 16, 17, 18, 19],
  }
end
