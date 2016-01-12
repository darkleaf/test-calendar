RSpec.describe 'registration', type: :request do
  context 'new' do
    it 'render with 200 status' do
      get '/registrations/new'
      expect(response).to be_success
    end
  end

  context 'create' do
    let(:registration_user_type_attrs) { attributes_for :registration_user_type }

    it 'sign in user' do
      post '/registrations', user: registration_user_type_attrs
      expect(response).to be_redirect
    end
  end
end
