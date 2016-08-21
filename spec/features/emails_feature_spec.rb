require 'rails_helper'

feature 'emails' do
    context 'one email sent event data received' do
    before :each do
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

    scenario 'it should display total number of emails events' do
      visit '/emails'
      expect(page).to have_content 'Emails sent: 16'
      expect(page).to have_content 'Emails opened: 8'
      expect(page).to have_content 'Emails clicked: 5'
    end

    scenario 'it should display open rate per email type' do
      visit '/emails'
      expect(page).to have_content 'Open rate per Order email: 40.0%'
      expect(page).to have_content 'Open rate per Shipment email: 100.0%'
      expect(page).to have_content 'Open rate per UserConfirmation email: 25.0%'
      expect(page).to have_content 'Open rate per GetABookDiscount email: 33.33%'
      expect(page).to have_content 'Open rate per ReferAFriend email: 100.0%'
    end

    scenario 'it should display click rate per email type' do
      visit '/emails'
      expect(page).to have_content 'Click rate per Order email: 20.0%'
      expect(page).to have_content 'Click rate per Shipment email: 100.0%'
      expect(page).to have_content 'Click rate per UserConfirmation email: 25.0%'
      expect(page).to have_content 'Click rate per GetABookDiscount email: 33.33%'
      expect(page).to have_content 'Click rate per ReferAFriend email: 0.0%'
    end


  def create_email(address: 'fakeperson@lostmyna.me', email_type: 'Order', event: 'send', timestamp: '1471441341') 
    Email.create(address: address, email_type: email_type, event: event, timestamp: timestamp)
  end
end
end
