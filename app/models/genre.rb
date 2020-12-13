class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: 'カテゴリーを選択してください' },
    { id: 2, name: '野菜' },
    { id: 3, name: '豚肉' },
    { id: 4, name: '牛肉' },
    { id: 5, name: '鶏肉' },
    { id: 6, name: '魚介' },
    { id: 7, name: 'ごはんもの' },
    { id: 8, name: 'パスタ' },
    { id: 9, name: '麺' },
    { id: 10, name: 'サラダ' },
    { id: 11, name: 'スープ・汁物' },
    { id: 12, name: 'お弁当' },
    { id: 13, name: 'おもてなし' },
    { id: 14, name: '洋菓子' },
    { id: 15, name: '和菓子' },
    { id: 16, name: 'パン' },
    { id: 17, name: '揚げもの' },
    { id: 18, name: '鍋もの' },
    { id: 19, name: 'たまご' },
    { id: 20, name: '粉もの' },
    { id: 21, name: '離乳食' },
    { id: 22, name: 'ヘルシーおかず' },
    { id: 23, name: 'ソース・ドレッシング' },
    { id: 24, name: 'おつまみ' },
    { id: 25, name: '海藻・乾物' },
    { id: 26, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :recipes
end
