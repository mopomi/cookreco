FactoryBot.define do
  factory :user do
    name                  { '田中太郎' }
    email                 { 'dkf435hkjse6@gmail.com' }
    password              { '111111' }
    password_confirmation { password }
  end
end
