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
      5.times {create_email(email_type: 'Order')}
      2.times {create_email(email_type: 'Shipment')}
      4.times {create_email(email_type: 'UserConfirmation')}
      3.times {create_email(email_type: 'GetABookDiscount')}
      2.times {create_email(email_type: 'ReferAFriend')}
      2.times {create_email(email_type: 'Order', event: 'open')}
      2.times {create_email(email_type: 'Shipment', event: 'open')}
      1.times {create_email(email_type: 'UserConfirmation', event: 'open')}
      1.times {create_email(email_type: 'GetABookDiscount', event: 'open')}
      2.times {create_email(email_type: 'ReferAFriend', event: 'open')}
      1.times {create_email(email_type: 'Order', event: 'click')}
      2.times {create_email(email_type: 'Shipment', event: 'click')}
      1.times {create_email(email_type: 'UserConfirmation', event: 'click')}
      1.times {create_email(email_type: 'GetABookDiscount', event: 'click')}
    end

    describe '#total_sent' do
      it 'counts number of sent emails' do
        expect(email.total_sent).to eq(16)
      end
    end
    describe '#total_opened' do
      it 'counts number of opened emails' do
       expect(email.total_opened).to eq(8) 
      end
    end

    describe '#total_clicked' do
      it 'counts number of opened emails' do
       expect(email.total_clicked).to eq(5) 
      end
    end
  end

  def create_email(address: 'fakeperson@lostmyna.me', email_type: 'Order', event: 'send', timestamp: '1471441341') 
    Email.create(address: address, email_type: email_type, event: event, timestamp: timestamp)
  end

end
