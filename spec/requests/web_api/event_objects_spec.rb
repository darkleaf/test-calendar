RSpec.describe 'web_api event objects', type: :request do
  let(:user) { create :user }
  before(:each) { sign_in user }

  context 'show' do
    it 'render with 200 status' do
      get '/web_api/event_objects'
      expect(response).to be_success
    end
  end
end
