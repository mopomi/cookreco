FactoryBot.define do
  factory :recipe do
    title          { 'お料理名' }
    genre_id       { 2 }
    url            { 'http://000000000.com' }
    point          { 'ポイント' }
  end
end
