FactoryBot.define do
  factory :change_request_mapping do
    user_id { 1 }
    task_id { 1 }
    is_requested { "MyString" }
    role_change_id { 1 }
  end
end
