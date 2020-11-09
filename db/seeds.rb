#Delete data collection

Address.delete_all
ContactNumber.delete_all
Company.destroy_all
Family.delete_all
Principal.destroy_all
Business.delete_all
Note.delete_all
Address.delete_all
AddressMapping.delete_all
ContactNumber.delete_all
Principal.delete_all
Business.delete_all
ContactChangeRequest.delete_all
ChangeRequestMapping.delete_all
QuestionaireAnswer.delete_all
Role.delete_all
Right.delete_all
RolesRight.delete_all
Document.delete_all
FeduciaryDocument.delete_all
Task.delete_all
TaskGroup.delete_all
User.delete_all
#Creating Data collection
QuestionType.create(name: "5500")
QuestionType.create(name: "Plans")
AddressType.create(task_name: "Biling Address")
AddressType.create(task_name: "Mailing Address")
AddressType.create(task_name: "Business Address")
AddressType.create(task_name: "Home Address")
AddressType.create(task_name: "Legal Address")
AddressType.create(task_name: "Old Address")
AddressType.create(task_name: "Overnight Address")
AddressType.create(task_name: "Physical Address")

Role.create(name: "Admin")
RolesRight.create(role_id: Role.last.id,role_type: {"rights":""})
User.create(username: "haris",email: "hariszahid944@gmail.com",password: "123456",role_id: Role.last.id)
TaskGroup.create(user_id: User.last.id)
Role.create(name: "Technician")
RolesRight.create(role_id: Role.last.id,role_type: {"rights":""})
User.create(username: "Chris",email: "chris@gmail.com",password: "123456",role_id: Role.last.id)
TaskGroup.create(user_id: User.last.id)
Role.create(name: "Main Contact")
RolesRight.create(role_id: Role.last.id,role_type: {"rights":""})
User.create(username: "Anderson",email: "anderson@gmail.com",password: "123456",role_id: Role.last.id)
TaskGroup.create(user_id: User.last.id)

# Company.delete_all
# Note.delete_all

