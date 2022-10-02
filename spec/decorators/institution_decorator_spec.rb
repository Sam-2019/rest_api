require 'rails_helper'

RSpec.describe InstitutionDecorator do
  let(:institution) { build(:institution) }
  let(:verified_institution) { build(:institution, state: 'verified') }
  let(:decorated_institution) { ActiveDecorator::Decorator.instance.decorate(institution) }
  let(:decorated_verified_institution) { ActiveDecorator::Decorator.instance.decorate(verified_institution) }

  describe 'institution' do
    it 'name' do
      expect(decorated_institution.institution_name).to eq('School+1')
      expect(decorated_institution.institution_name).to include("School+")
    end

    it 'location' do
      expect(decorated_institution.institution_location).to eq('World+2')
      expect(decorated_institution.institution_location).to include("World+")
    end

    it 'state' do
      expect(decorated_institution.current_state).to eq('not_verified')
      expect(decorated_verified_institution.current_state).to eq('verified')
    end
  end
end
