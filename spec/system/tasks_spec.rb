require 'rails_helper'

describe 'タスク管理機能だ', type: :system do
  describe '一覧表示機能だね' do
    before do
      user_a = FactoryBot.create(:user, name:'ユーザA', email: 'a@example.com')
      FactoryBot.create(:task, name: '最初のタスク', user: user_a)
    end

    context 'ユーザAがログインしてる時' do
      before do
        visit login_path
        fill_in 'メールアドレス', with: 'a@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログインする'
      end

      it 'ユーザAが作成したタスクが表示される' do
        expect(page).to have_context '最初のタスク'
      end
    end
  end
end
