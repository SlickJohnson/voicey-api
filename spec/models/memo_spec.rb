require 'rails_helper'

RSpec.describe Memo, type: :model do
  subject {
    User.new(name: "Eliel", email: "eliel@test.com")
  }
  describe "Validations" do
    it "is valid with attributes" do
      memo = Memo.new(
        title: "Omem",
        date: DateTime.now.utc,
        text_body: "Ydob",
        user: subject
      )
      expect(memo).to be_valid
    end

    it "is invalid without title" do
      bad_memo = Memo.new(
        title: nil,
        date: DateTime.now.utc,
        text_body: "Ydob",
        user: subject
      )
      expect(bad_memo).not_to be_valid
    end
    
    it "is invalid without date" do
      bad_memo = Memo.new(
        title: "Omen",
        date: nil,
        text_body: "Ydob",
        user: subject
      )
      expect(bad_memo).not_to be_valid
    end

    it "is invalid without text_body" do
      bad_memo = Memo.new(
        title: "Omen",
        date: DateTime.now.utc,
        text_body: nil,
        user: subject
      )
      expect(bad_memo).not_to be_valid
    end

    it "is invalid without user" do
      bad_memo = Memo.new(
        title: "Omen",
        date: DateTime.now.utc,
        text_body: "Ydob",
        user: nil
      )
      expect(bad_memo).not_to be_valid
    end
  end
end
