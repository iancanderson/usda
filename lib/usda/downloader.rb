require 'open-uri'

module Usda
  class Downloader
    TEMP_DIR = 'usda_temp'
    ZIP_FILE_URL = "http://www.ars.usda.gov/SP2UserFiles/Place/12354500/Data/SR24/dnload/sr24.zip"

    def run
      download
      unzip
    end

  private
    def download
      puts "Downloading #{ZIP_FILE_URL}..."
      @zip_file = open(ZIP_FILE_URL)
    rescue OpenURI::HTTPError
      puts "USDA data files have moved. Apparently the government doesn't believe in permalinks..."
    end

    def unzip
      return if @zip_file.nil?

      puts "Unzipping #{File.basename ZIP_FILE_URL}..."
      # todo - windows support?
      `unzip #{@zip_file.path} -d #{TEMP_DIR}`
      # return an array of all absolute filepaths unzipped
      relative_files = Dir.glob(File.join(TEMP_DIR, "*.txt")).map
      absolute_files = relative_files.map{ |file| File.join Dir.getwd, file }
    rescue Errno::ENOENT
      puts "Error unzipping the data files. Do you have the command-line utility 'unzip' installed?"
    end
  end
end
