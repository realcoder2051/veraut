class Company < ApplicationRecord

  def self.company_name_exist(company_name)
    company_name.present? ? "" : "Company Name can't be blank."
  end

  def self.ein_valid(ein)
    ein.present? && ein.to_s.length == 9 ? "" : "EIN must be 9 character."
  end

  def self.entity_type_exist(entity_type)
    entity_type.present? ? "" : "Entity Type can't be blank."
  end

  def self.payroll_frequency_exist(payroll_frequency)
    payroll_frequency.present? ? "" : "Payroll Frequency can't be blank."
  end

  def self.fiscal_year_end_exist(fiscal_year_end)
    fiscal_year_end.present? ? "" : "Fiscal Year End can't be blank."
  end

end
