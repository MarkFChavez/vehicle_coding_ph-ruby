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
  
  def self.coding_hours_per_area
    file = File.join(File.dirname(__FILE__), "sources", "coding_hours_of_areas.yml")
    YAML.load_file(file).map(&:with_indifferent_access)
  end
end
