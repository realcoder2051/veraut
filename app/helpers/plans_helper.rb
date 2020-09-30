module PlansHelper
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
end
