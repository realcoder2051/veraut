module PrincipalsHelper
	def calculate_total_ownership
		begin
			@principals.pluck("ownership").inject(0){|sum,x| sum + x }
		rescue
			return 0
		end
	end

	def principal_officer(principal)
	 	principal ? 'Yes' : 'No'
	end
end
