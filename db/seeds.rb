# QuestionType.create(name: "5500")
# QuestionType.create(name: "Plans")
# Role.create(name: "Admin")
# User.create(username: "haris",email: "hariszahid944@gmail.com",password: "123456",role_id: Role.last.id)
# TaskGroup.create(user_id: User.last.id)
QuestionaireAnswer.delete_all
