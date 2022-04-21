require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザーログイン機能' do
    it 'ログインしないでトップページにアクセスするとログインページに遷移する' do
      visit root_path
      expect(current_path).to eq(new_user_session_path)
    end
    it 'ログインに成功し、トップページに遷移する' do
      # 予め、ユーザーをDBに保存する
      @user.save
      # サインインページへ移動する
      visit root_path
      # ログインしていない場合、サインインページに遷移していることを確認する
      expect(current_path).to eq(new_user_session_path)
      # すでに保存されているユーザーのemailとpasswordを入力する
      fill_in "Email", with:@user.email
      fill_in "Password", with:@user.password
      # ログインボタンをクリックする
      click_on('Log in')
      # トップページに遷移していることを確認する
      expect(current_path).to eq(root_path)
    end
  
    it 'ログインに失敗し、再びサインインページに戻ってくる' do
      # 予め、ユーザーをDBに保存する
      @user.save
      # トップページに遷移する
      visit root_path
      # ログインしていない場合、サインインページに遷移していることを確認する
      expect(current_path).to eq(new_user_session_path)
      # 誤ったユーザー情報を入力する
      fill_in 'Email', with: ""
      fill_in 'Password', with: ""
      # ログインボタンをクリックする
      click_on('Log in')
      # サインインページに戻ってきていることを確認する
      expect(current_path).to eq user_session_path
    end
  end

end
