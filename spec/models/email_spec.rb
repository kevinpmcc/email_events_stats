require 'rails_helper'


describe Email, type: :model do

  context 'no sent mails' do
    describe '#event_total' do
      it 'returns no emails when none have been sent' do
        expect(Email.event_total('send')).to eq(0)
      end
    end
  end

  context 'one sent email' do
    before(:each) do
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

    describe '#event_total' do
      it 'counts number of sent emails' do
        expect(Email.event_total('send')).to eq(16)
      end

      it 'counts number of opened emails' do
        expect(Email.event_total('open')).to eq(8) 
      end

      it 'counts number of opened emails' do
        expect(Email.event_total('click')).to eq(5) 
      end
    end
    describe '#event_rate_by_type' do
      it 'calculates open rate of getabookdiscount' do
        expect(Email.event_rate_by_type(email_type: 'GetABookDiscount', event: 'open')).to eq 33.33
      end
      it 'calculates click rate of shipment' do
        expect(Email.event_rate_by_type(email_type: 'Shipment', event: 'click')).to eq 100.00 
      end
    end
  end

  def create_email(address: 'fakeperson@lostmyna.me', email_type: 'Order', event: 'send', timestamp: '1471441341') 
    Email.create(address: address, email_type: email_type, event: event, timestamp: timestamp)
  end

end
