#  QuestionType.create(name: "5500")
#  QuestionType.create(name: "Plans")
#  Role.create(name: "Admin")
#  User.create(username: "haris",email: "hariszahid944@gmail.com",password: "123456",role_id: Role.last.id)
#  TaskGroup.create(user_id: User.last.id)
#  QuestionaireAnswer.delete_all


# Delete data collection

Address.delete_all
ContactNumber.delete_all
Company.delete_all
Family.delete_all
Principal.delete_all
Business.delete_all