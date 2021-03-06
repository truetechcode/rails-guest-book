require 'rails_helper'

RSpec.describe Message, type: :model do
  context 'validations' do
    it "validates that all required parameters are provided" do
      should validate_presence_of(:name)
      should validate_presence_of(:entry)
      should validate_presence_of(:ip_address)
    end
  end
end
