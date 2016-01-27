FactoryGirl.define do
  factory :member do
    sequence(:number) { |n| n + 1 }
    sequence(:name) { |n| "Taro#{n}" }
    full_name "東京 次郎"
    sequence(:email) { |n| "taro#{n}@example.com" }
    remark "インフォメーションがここに入る。"
    password "p@ssw0rd"
    password_confirmation "p@ssw0rd"
  end
end
