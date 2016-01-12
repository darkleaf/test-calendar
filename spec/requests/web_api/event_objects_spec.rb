RSpec.describe 'web_api event objects', type: :request do
  let(:user) { create :user }
  before(:each) { sign_in user }

  let(:filter) do
    {
        start: 1.month.ago.to_date.to_s,
        end: 1.month.since.to_date.to_s
    }
  end

  let!(:event) { create :event, date: Date.today, repeat_period: :week }
  let!(:event2) { create :event }

  context 'index' do
    it 'render with 200 status' do
      get '/web_api/event_objects', filter
      expect(response).to be_success
    end
  end
end
