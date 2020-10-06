module QuestionaireAnswersHelper
  def plans
    @plans ||= [
      "1.Were any participant contributions transmitted to the plan later than 7 business days after the payroll date? (ERISA Regulation 2510.3-102)",
      "2.Were there any former plan participants that returned to work during this plan year?  If yes, please provide their name, original date of hire, date of termination and date of rehire on the census form.",
      "3.Has the Employer utilized the services of any leased or contract employees? A leased employee is someone who (a) has performed services for the Employer on a substantially full-time basis for a period of at least 12 months; (b) has performed services under the primary direction or control of the Employer; and (c) was paid through a leasing organization which then pays the income directly to the employee?",
      "4. Will a request for extension of time for filing the company’s income tax return be made for this year?",
      "5.Does the employer maintain any other qualified retirement plan that is self-administered or administered by another third party administrator?",
      "6.Did the employer or any related employer make contributions on behalf of any participant in this plan to any other retirement plan during the year?",
      "7. Does the Employer maintain a Cafeteria or Section 125 Plan, employer sponsored Health Savings Accounts or a non-qualified deferred compensation plan?",
      "8.Does the company or its owners have ownership in any other entities? If yes, please contact your administrator.",
      "9.Have you acquired or were acquired, bought, or merged with any other entity?",
      "10. Does the company desire to make an employer contribution or matching contribution in addition to any contributions made during the plan year?",
      "11.Would you like us to calculate any additional employer contributions for the plan year?",
      "12.Please indicate the last pay date (check date) that occurred during the plan year."
    ]
  end

  def questions
    @questions ||= [
    "1. Did the plan hold any assets whose current value was neither readily determinable on an established market nor set by an independent third party appraiser?",
    "2.Did the plan receive any noncash contributions whose current value was neither readily determinable on an established market nor set by an independent third party appraiser?",
    "3.Is the plan covered by a Fidelity Bond?",
    "4. If yes, please enter the Fidelity Bond amount.",
    "5.Were any loans by the plan or fixed income obligations due to the plan in default as of the end of the close of the plan year or classified as uncollectible?  Disregard participant loans secured by the participant’s account balance.",
    "6.Were any leases to which the plan was a party in default or classified during the year as uncollectible?"
    ]
  end

  def is_plan_exist?
    task = Task.find(session[:task_id])
    first_plan = task.questionaire_answers.first.question_type_id if task.questionaire_answer.present?
    last_plan = task.questionaire_answers.last.question_type_id if task.questionaire_answer.present?
    if first_plan == 1 || last_plan == 1
      return true
    else
      return false
    end
  end

  def is_question_exist?
    task = Task.find(session[:task_id])
    first_plan = task.questionaire_answers.first.question_type_id if task.questionaire_answer.present?
    last_plan = task.questionaire_answers.last.question_type_id if task.questionaire_answer.present?
    if first_plan == 2 || last_plan == 2
      return true
    else
        return false
    end
  end

  def get_value(index)
    return @questionaire_answer[index].answer if @questionaire_answer[index].present?
  end

  def get_id(index)
    return @questionaire_answer[index].id if @questionaire_answer[index].present?
  end

end
