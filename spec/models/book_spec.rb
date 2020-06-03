require 'rails_helper'
RSpec.describe Book, "モデルに関するテスト", type: :model do
    it "有効な値の場合、be_validがtrueになる" do
      expect(FactoryBot.build(:book)).to be_valid
    end
    it "有効な値の場合、bookが一つ増える" do
      expect {FactoryBot.create(:book)} .to change{ Book.count }.by(1)
    end

    it "削除すると、bookが一つ減る" do
      book = FactoryBot.create(:book)
      expect{ book.destroy }.to change{ Book.count }.by(-1)
    end


    it "titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      book = FactoryBot.build(:book, title: "")
      expect(book).to be_invalid
      expect(book.errors[:title]).to include("can't be blank")
    end
    it "bodyが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      book = FactoryBot.build(:book, body: "")
      expect(book).to be_invalid
      expect(book.errors[:body]).to include("can't be blank")
    end

end
