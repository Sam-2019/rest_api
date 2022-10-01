require 'rails_helper'

RSpec.describe UserDecorator do
    let(:user) { build(:user) }
    let(:decorated_user) { ActiveDecorator::Decorator.instance.decorate(user) }

    describe 'user' do
        it 'full name' do      
          expect(decorated_user.full_name).to eq('First+1 Last+1')
          expect(decorated_user.full_name).to include("First+")
          expect(decorated_user.full_name).to include("Last+")
        end

        it 'email address' do
            expect(decorated_user.email_address).to eq('email+2@example.com')
            expect(decorated_user.email_address).to include("email+")
            expect(decorated_user.email_address).to include("@example.com")
          end

          it 'state' do
            expect(decorated_user.current_state).to eq('not_verified')
          end
      end
end
