require_relative 'communication_display'

class FileFinder
  def call
    display_file
    choose_file
  end

  private

  def display_file
    count = 1
    get_csv_folder.each do |file_name|
      p "#{count} - #{file_name}"
      count += 1
    end  
  end

  def get_csv_folder
    Dir.children('csv_files')
  end  

  def choose_file
    display_chosen_value
    value = gets.chomp.to_i
    csv_chosen = get_csv_folder[value - 1]
    file = File.read("../OO/csv_files/#{csv_chosen}")
  end

  def display_chosen_value
    CommunicationDisplay.chosen_value
  end
end
