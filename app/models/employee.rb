class Employee < ApplicationRecord
	#validates_length_of :ssn, :maximum => 9
	#validates :first_name,:last_name,:ssn,:date_of_birth,:original_date_of_hire, :compensation, :hours, presence: true


	def self.update_imported_store(file,session)	
		h1 = ["FIRSTNAME","LASTNAME","FULLNAME","SSN","GENDER","DATEOFBIRTH","ORIGINALDATEOFHIRE","DATEOFTERMINATION","DATEOFRETIRE","COMPENSATION","HOURS","PRETAXSALARYDEFERAL","ROTHSALARYDEFERAL","EMPLOYEEMATCH","COMPANYDIVISION","UNIONEMPLOYEE"]
		h2 = ["FIRST_NAME","LAST_NAME","FULL_NAME","SSN","GENDER","DATE_OF_BIRTH","ORIGINAL_DATE_OF_HIRE","DATE_OF_TERMINATION","DATE_OF_RETIRE","COMPENSATION","HOURS","PRE_TAX_SALARY_DEFERAL","ROTH_SALARY_DEFERAL","EMPLOYEE_MATCH","COMPANY_DIVISION","UNION_EMPLOYEE"]
		spreadsheet = open_spreadsheet(file)
		file_header = spreadsheet.row(1)
		header = ["first_name", "last_name", "ssn", "gender", "date_of_birth", "original_date_of_hire", "date_of_termination", "date_of_retire", "compensation", "hours", "pre_tax_salary_deferal", "roth_salary_deferal", "employee_match", "company_division", "union_employee"]
		header.insert(2,"full name")	if (file_header[2] == "Full Name")
		header = header.to_a
		file_header = file_header.map(&:upcase)
		file_header.each do |s|
			s.gsub!(' ', '')
		end
		array = []
		file_header.each do |header|
			if h1.include?(header) || h2.include?(header)
				array<<header
			else
				return false
			end
		end
		#if file_header.include?("FIRSTNAME") || file_header == h2
		if array.length > 0
			(2..spreadsheet.last_row).each do |i|
				row = Hash[[header, spreadsheet.row(i)].transpose]
				row.delete("full name")
				if Employee.exists?(ssn: row['ssn'], task_id: session,active: false)
					Employee.where(ssn: row['ssn'], task_id: session).update(row)
				else
					@employee = Employee.new(row)
					@employee.task_id = session
					@employee.save
				end
			end
			return true
		else
			return false
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
