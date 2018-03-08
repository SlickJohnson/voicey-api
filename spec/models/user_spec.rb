require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
      it "is valid with attributes" do
        user = User.new(name: "Will", email: "will@test.com", password: "akldjfls")
        expect(user).to be_valid
      end

      it "is invalid without a name" do
        bad_user = User.new(name: nil, email: "test@mail.com", password: "akldjfls")
        expect(bad_user).to_not be_valid
      end

      it "is invalid without an email" do
        bad_user = User.new(name: "Will", email: nil)
        expect(bad_user).to_not be_valid
      end

      it "is invalid without a password" do
        bad_user = User.new(name: "Will", email: "test@mail.com", password: nil)
        expect(bad_user).to_not be_valid
    end

    describe "Associations" do
      it "should have many memos" do
        assoc = User.reflect_on_association(:memos)
        expect(assoc.macro).to eq :has_many
      end
    end
  end
end
