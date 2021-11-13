require 'csv'
require 'byebug'
require_relative 'communication_display'

class CsvParser
  def initialize(csv:)
    @csv = csv
  end

  def call
    scrap_csv
  end

  private

  def scrap_csv
    final_array  
  end

  def final_array
    get_chosen_values
    array_of_hash.inject([]) do |acc, hash|
      acc << {
              "#{@chosen_values[0].strip}": hash["#{@chosen_values[0].strip}"],
              "#{@chosen_values[1].strip}": hash["#{@chosen_values[1].strip}"]
              }
    end
  end

  def get_chosen_values
    chose_ur_keys
    @chosen_values = gets.chomp.split(',')
    chosen_keys
  end

  def chose_ur_keys
    CommunicationDisplay.chose_ur_keys(keys: array_of_hash.first.keys)
  end

  def chosen_keys
    CommunicationDisplay.chosen_keys
  end

  def array_of_hash
    doc_csv.map {|row| row.to_hash }
  end

  def doc_csv
    CSV.parse(@csv, headers: true)
  end
end
