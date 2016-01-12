RSpec.describe 'calendar', type: :request do
  let(:user) { create :user }
  before(:each) { sign_in user }

  context 'show' do
    it 'render with 200 status' do
      get '/calendar'
      expect(response).to be_success
    end
  end
end
