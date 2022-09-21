require 'rails_helper'

RSpec.describe Institution, type: :model do
  let(:institution) { build(:institution) }
  let(:institution_without_name) { build(:institution, name: nil) }
  let(:institution_without_location) { build(:institution, location: nil) }
  
  describe "Validation" do
    it "without name" do
    expect(institution_without_name.valid?).to be false
    end

    it "without location" do
      expect(institution_without_location.valid?).to be false
    end

    it "with valid attributes" do
      expect(institution.valid?).to be true
    end
  end
end
