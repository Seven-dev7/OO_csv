require 'csv'
require 'byebug'
require_relative 'communication_display'

class CsvWriter
  def initialize(parsed_csv:)
    @parsed_csv = parsed_csv
  end

  def call
    new_csv
    get_ur_file
  end

  private

  def new_csv
    csv_writer(csv: csv_generator)
  end

  def csv_generator
    csv_header
    csv_output = CSV.generate do |csv|
      csv << csv_header
      @parsed_csv.each do |hash|
        csv << hash.values_at(*csv_header)
      end
    end
  end

  def csv_header
    @parsed_csv.map(&:keys).flatten.uniq
  end

  def csv_writer(csv:)
    File.write('../OO/new_csv/new_csv.csv', csv)
  end

  def get_ur_file
    CommunicationDisplay.get_ur_file
  end
end
