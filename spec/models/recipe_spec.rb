require 'rails_helper'
describe User do
  before do
    @recipe = FactoryBot.build(:recipe)
  end

  it '画像がない場合は登録できないこと' do
    @recipe.image = nil
    @recipe.valid?
    expect(@recipe.errors.full_messages).to include '画像を選択してください'
  end

  it 'お料理名がない場合は登録できないこと' do
    @recipe.title = ''
    @recipe.valid?
    expect(@recipe.errors.full_messages).to include 'お料理名を入力してください'
  end

  it 'カテゴリーの選択がない場合は登録できないこと' do
    @recipe.genre_id = '1'
    @recipe.valid?
    expect(@recipe.errors.full_messages).to include 'カテゴリーを選択してください'
  end
end
