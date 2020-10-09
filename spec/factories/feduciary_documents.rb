FactoryBot.define do
  factory :feduciary_document do
    plan { "MyString" }
    type { "" }
    description { "MyString" }
    effective_date { "2020-10-08" }
    period_end { "2020-10-08" }
    taskgroup { nil }
  end
end
