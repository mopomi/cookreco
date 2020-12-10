require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  it 'nameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
    expect(@user).to be_valid
  end

  it 'nameがない場合は登録できないこと' do
    @user.name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include "ニックネームを入力してください"
  end

  it 'emailがない場合は登録できないこと' do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include "Eメールを入力してください"
  end

  it 'passwordがない場合は登録できないこと' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include "パスワードを入力してください"
  end

  it 'passwordが存在してもpassword_confirmationがない場合は登録できないこと' do
    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
  end

  it ' passwordが5文字以下であれば登録できないこと ' do
    @user.password = '11111'
    @user.password_confirmation = '11111'
    @user.valid?
    expect(@user.errors.full_messages).to include 'パスワードは6文字以上で入力してください'
  end

  it 'emailに@がないと登録できないこと ' do
    @user.email = 'tttgmail.com'
    @user.valid?
    expect(@user.errors.full_messages).to include 'Eメールは不正な値です'
  end

  it ' 重複したemailが存在する場合は登録できないこと ' do
    @user.save
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include 'Eメールはすでに存在します'
  end
end