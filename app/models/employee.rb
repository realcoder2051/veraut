class Employee < ApplicationRecord
  validates_length_of :ssn, :maximum => 9

  def self.update_imported_store(file)
      spreadsheet = open_spreadsheet(file)
      header = spreadsheet.row(1)
        header = header.to_a
        (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        if Employee.exists?(ssn: row['ssn'])
          Employee.where("ssn =?", row['ssn']).update(row)
          next
        end 
        @employee = Employee.new(row)
        @employee.save
        end
      end

      def self.open_spreadsheet(file)
      case File.extname(file.original_filename)
      when ".csv" then  Roo::CSV.new(file.path, packed: nil, file_warning: :ignore, csv_options: {encoding: Encoding::SJIS})
      when ".xls" then  Roo::Excel.new(file.path, packed: nil, file_warning: :ignore)
      when ".xlsx" then  Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
      end
    end

enum status: {
  pending: 0,
  active: 1
}


end
