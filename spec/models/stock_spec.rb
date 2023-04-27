require 'rails_helper'

RSpec.describe Stock, type: :model do
  let(:user) { create :user }

  it "belongs to user" do
    expect(described_class.reflect_on_association(:user).macro).to eq :belongs_to
  end

  it "has many orders" do
    expect(described_class.reflect_on_association(:orders).macro).to eq :has_many
  end

end
