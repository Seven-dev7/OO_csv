require_relative 'csv_parser'
require_relative 'csv_writer'
require_relative 'file_finder'
require_relative 'communication_display'

class Launcher
  def call
    introduction_display
    csv_writer
  end

  private

  def introduction_display
    CommunicationDisplay.introduction
  end

  def csv_writer
    CsvWriter.new(parsed_csv: csv_parser).call
  end

  def csv_parser
    CsvParser.new(csv: FileFinder.new.call).call
  end
end
