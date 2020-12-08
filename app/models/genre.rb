class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ご飯もの' },
    { id: 3, name: '麺' },
    { id: 4, name: '鶏肉' },
    { id: 5, name: '豚肉' },
    { id: 6, name: '牛肉' },
    { id: 7, name: '野菜' },
    { id: 8, name: 'スイーツ' },
    { id: 9, name: 'パン' },
    { id: 10, name: 'その他' }
  ]
 
   include ActiveHash::Associations
   has_many :recipes
 
  end