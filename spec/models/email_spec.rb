require 'rails_helper'


describe Email, type: :model do

let(:email) { subject }
  context 'no sent mails' do
    describe '#total_sent' do
      it 'returns no emails when none have been sent' do
      expect(email.total_sent).to eq(0)
      end
    end
  end

  context 'one sent email' do
    before do
      Email.create(address: 'barney@lostmy.name',
                   email_type: 'Shipment',
                   event: 'send',
                   timestamp: '1471429434')
    end

  describe '#total_sent' do
    it 'counts number of sent emails' do
      expect(email.total_sent).to eq(1)
    end
  end
  end
end
