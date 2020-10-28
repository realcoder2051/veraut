module PrincipalsHelper
	def calculate_total_ownership
		begin
			Principal.where("task_id=? and active = ?",session[:task_id],false).pluck("ownership").inject(0){|sum,x| sum + x }
		rescue
			return 0
		end
	end

	def principal_officer(principal)
	 	principal ? 'Yes' : 'No'
	end
end
