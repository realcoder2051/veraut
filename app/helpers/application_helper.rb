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
		steps = steps.kind_of?(Array) ? steps : [steps]
		
		step_completed = false			
		steps.each do |step|	 
			step_completed = step.present?			
		end
		@count += 1 if step_completed == false  
		step_completed ?  'complete' : 'disabled'
	end
	
	def step_incomplete(incomplete)
		@step_incomplete ||= incomplete if incomplete.present?
		@step_incomplete
	end
	
	def btn_status
		@count == 0 ? 'active' : 'disabled'
	end

	# Notes count Function
	def no_of_notes(collection_step)
		notes = Note.where("data_collection_step =? AND task_id =?" , collection_step , session[:task_id]).count
	end
	
end
