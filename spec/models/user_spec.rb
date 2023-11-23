require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create :user }
  let(:seller) { build(:user, role: "seller") }
  let(:admin) { create(:user, :admin_user )}

  describe "user role" do
    it "should have a default value of trader" do
      expect(user.role == "trader").to be true
    end

    it "should not validate any role other than admin & trader" do
      expect(seller.save).to be false
    end

    it "should create an account if role value is either admin or trader " do
      expect(admin.role == "admin").to be true
    end
  end

  describe "approved status" do
    it "should have a default value 'false' " do
      expect(user.approved == false).to be true
    end
  end 

end
