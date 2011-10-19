require 'csv'
require 'set'

module Usda
  class ImportParser
    def initialize(filename)
      @filename = filename
    end

    def parse
      csv_options = {
        :quote_char => '~',
        :col_sep => '^'
      }

      @set_column_numbers = Set.new
      active_records = []
      CSV.foreach(@filename, csv_options) do |row|
        @set_column_numbers << row.count
        active_records << active_record_from_row(row)
      end
      results_valid? ? active_records : []
    end

  private
    def results_valid?
      @set_column_numbers.count == 1
    end
    def active_record_from_row row
      #todo
      row
    end
  end
end
