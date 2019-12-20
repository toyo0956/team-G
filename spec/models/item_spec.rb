require 'rails_helper'

describe Item do
  describe '#create' do
    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end
    it "is invalid without a description" do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end
    it "is invalid without a category" do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include("を入力してください")
    end
    it "is invalid without a condition" do
      item = build(:item, condition: "")
      item.valid?
      expect(item.errors[:condition]).to include("を入力してください")
    end
    it "is invalid without a feepayer" do
      item = build(:item, feepayer: nil)
      item.valid?
      expect(item.errors[:feepayer]).to include("を入力してください")
    end
    it "is invalid without a region_id" do
      item = build(:item, region_id: nil)
      item.valid?
      expect(item.errors[:region_id]).to include("を入力してください")
    end
    it "is invalid without a days" do
      item = build(:item, days: nil)
      item.valid?
      expect(item.errors[:days]).to include("を入力してください")
    end
    it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end
  end
end