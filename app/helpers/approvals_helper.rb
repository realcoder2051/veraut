module ApprovalsHelper

  def check_all_steps_completed?
    step_completed = []
    @steppers.each do |key,stepper|
      step_completed << @steppers[key].include?(true)
    end
    step_completed.include?(false) ? false : true
  end

end
