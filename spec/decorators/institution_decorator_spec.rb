require 'rails_helper'

RSpec.describe InstitutionDecorator do
    let(:institution) { build(:institution) }

    describe 'institution' do
        it 'name' do
          decorated_organization = ActiveDecorator::Decorator.instance.decorate(institution)
      
          expect(decorated_organization.institution_name).to eq('School+1')
          expect(decorated_organization.institution_name).to include("School+")
        end

        it 'location' do
            decorated_organization = ActiveDecorator::Decorator.instance.decorate(institution)
        
            expect(decorated_organization.institution_location).to eq('World+2')
            expect(decorated_organization.institution_location).to include("World+")
          end

        it 'state' do
        decorated_organization = ActiveDecorator::Decorator.instance.decorate(institution)
    
        expect(decorated_organization.current_state).to eq('not_verified')
        end
      end
end
