require 'rails_helper'

RSpec.describe UserDecorator do
    let(:user) { build(:user) }

    describe 'user' do
        it 'full name' do
          decorated_organization = ActiveDecorator::Decorator.instance.decorate(user)
      
          expect(decorated_organization.full_name).to eq('First+1 Last+1')
          expect(decorated_organization.full_name).to include("First+")
          expect(decorated_organization.full_name).to include("Last+")
        end

        it 'email address' do
            decorated_organization = ActiveDecorator::Decorator.instance.decorate(user)
        
            expect(decorated_organization.email_address).to eq('email+2@example.com')
            expect(decorated_organization.email_address).to include("email+")
            expect(decorated_organization.email_address).to include("@example.com")
          end

          it 'state' do
            decorated_organization = ActiveDecorator::Decorator.instance.decorate(user)
        
            expect(decorated_organization.current_state).to eq('not_verified')
          end
      end
end
