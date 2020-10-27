module ApplicationHelper

  include Pagy::Frontend

  def pretty_boolean(bool)
    if [true, 'true', 'yes', 'success'].include?(bool)
      "<span class='badge badge-success'>#{bool}</span>"
    else
      "<span class='badge badge-danger'>#{bool}</span>"
    end.html_safe
  end

  def flash_class(level)
    case level.to_sym
      when :notice then 'alert alert-info'
      when :success then 'alert alert-success'
      when :error then 'alert alert-danger'
      when :alert then 'alert alert-warning'
    end
	end

	def count
		@count = 0
	end

	def wizard_step_status(steps)
		@steppers[steps.to_sym]==true   ?  'complete' : 'disabled'
		# steps = steps.kind_of?(Array) ? steps : [steps]
		# step_completed = false
		# steps.each do |step|
		# 	puts "1233213----------------------1231231231-----------------"
		# 	puts @steppers[step.to_sym]
		# 	step_completed = @steppers[step.to_sym].present?
		# end
		# @count += 1 if step_completed == false
		# step_completed ?  'complete' : 'disabled'



			# steps = steps.kind_of?(Array) ? steps : [steps]
		# step_completed = false
		# puts ("1221231321321132321312----------------------------------------123123123312")
		# steps.each do |step|
		# 	step_completed = step.present?
		# end
		# if @families_stepper.present?
		# 	@families_stepper

		# end
		# @count += 1 if step_completed == false
		# step_completed ?  'complete' : 'disabled'
	end

	def step_incomplete(incomplete)
		@step_incomplete ||= incomplete if incomplete.present?
		@step_incomplete
	end

	def btn_status
		@count == 0 ? 'btn-approval-active' : 'btn-approval-disabled'
	end

	def approval_check
		@count == 0 ? 'new_approval' : 'approval_warning'
	end

	# Notes count Function
	def no_of_notes(collection_step)
		notes = Note.where("data_collection_step =? AND task_id =?" , collection_step , session[:task_id]).count
	end

	def check_company_stepper?
		if @company_stepper.present?
		 if @company_stepper.entity_type == "" || @company_stepper.fiscal_year_end == "" || @company_stepper.payroll_frequency == "" || @company_stepper.ein == ""
			return false
		 else
			return true
		 end
		else
			return false
		end

	end

end
