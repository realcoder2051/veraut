module PrincipalsHelper
  def calculate_total_ownership
    @principals.pluck("ownership").inject(0){|sum,x| sum + x }
	end
	
	def principal_officer(principal)
	 	principal ? 'Yes' : 'No'
	end
end
