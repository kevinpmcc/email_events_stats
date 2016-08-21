require 'rails_helper'

RSpec.describe 'EmailEvents', :type => :request do

  it 'creates an email' do
    headers = { 'CONTENT_TYPE' => 'application/json' }
    post "/email-events", '{"Address":"barney@lostmy.name","EmailType":"Shipment","Event":"send","Timestamp":1471435479}', headers
    expect(response.status).to eq(200)
    first_email = EmailEvent.first
    expect(first_email.address).to eq('barney@lostmy.name')
    expect(first_email.email_type).to eq('Shipment')
    expect(first_email.event).to eq('send')
  end
end
