require 'rails_helper'

describe User do
  describe '#create' do
    it "全ての必要項目があれば、ユーザーを作成することができる" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "emailが空では登録できない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "nicknameが空では登録できない" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include()
    end
  end
end
