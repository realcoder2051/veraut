class Principal < ApplicationRecord
  validates :name,:ownership,:title, presence: true
  def self.calculate_total_ownership(id)
		begin
			Principal.where("task_id=? and active = ?",id,false).pluck("ownership").inject(0){|sum,x| sum + x }
    rescue
			return 0
		end
	end
end
