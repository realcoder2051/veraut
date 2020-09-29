FactoryBot.define do
  factory :approval do
    date { "2020-09-28" }
    status { false }
    user { nil }
  end
end
