#  QuestionType.create(name: "5500")
#  QuestionType.create(name: "Plans")
#  Role.create(name: "Admin")
#  User.create(username: "haris",email: "hariszahid944@gmail.com",password: "123456",role_id: Role.last.id)
#  TaskGroup.create(user_id: User.last.id)
#  QuestionaireAnswer.delete_all


# Delete data collection

# Address.delete_all
# ContactNumber.delete_all
 #Company.destroy_all
# Family.delete_all
 #Principal.destroy_all
# Business.delete_all


# Note.delete_all
# AddressType.create(task_name: "Biling Address")
# AddressType.create(task_name: "Mailing Address")
# AddressType.create(task_name: "Business Address")
# AddressType.create(task_name: "Home Address")
# AddressType.create(task_name: "Legal Address")
# AddressType.create(task_name: "Old Address")
# AddressType.create(task_name: "Overnight Address")
# AddressType.create(task_name: "Physical Address")
#Address.all.update(active: false)

Address.delete_all
AddressMapping.delete_all



