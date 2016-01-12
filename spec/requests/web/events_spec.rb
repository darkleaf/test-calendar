RSpec.describe 'events', type: :request do
  let(:user) { create :user }
  before(:each) { sign_in user }

  let(:event) { create :event, user: user }
  let(:event_attrs) { attributes_for :event }

  context 'new' do
    it 'render with 200 status' do
      get '/events/new'
      expect(response).to be_success
    end
  end

  context 'create' do
    it 'success' do
      post '/events', event: event_attrs
      expect(response).to be_redirect
    end
  end

  context 'edit' do
    it 'render with 200 status' do
      get "/events/#{event.to_param}/edit"
      expect(response).to be_success
    end
  end

  context 'update' do
    it 'success' do
      patch "/events/#{event.to_param}", event: event_attrs
      expect(response).to be_redirect
    end
  end

  context 'destroy' do
    it 'success' do
      delete "/events/#{event.to_param}"
      expect(Event).to_not be_exists(id: event.id)
    end
  end
end
