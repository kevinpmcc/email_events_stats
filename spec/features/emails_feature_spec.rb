require 'rails_helper'
require 'create_emails_helper'

feature 'email events statistics' do
  context 'one email sent event data received' do
    before :each do
      5.times { create_email(email_type: 'Order') }
      2.times { create_email(email_type: 'Shipment') }
      4.times { create_email(email_type: 'UserConfirmation') }
      3.times { create_email(email_type: 'GetABookDiscount') }
      2.times { create_email(email_type: 'ReferAFriend') }
      2.times { create_email(email_type: 'Order', event: 'open') }
      2.times { create_email(email_type: 'Shipment', event: 'open') }
      1.times { create_email(email_type: 'UserConfirmation', event: 'open') }
      1.times { create_email(email_type: 'GetABookDiscount', event: 'open') }
      2.times { create_email(email_type: 'ReferAFriend', event: 'open') }
      1.times { create_email(email_type: 'Order', event: 'click') }
      2.times { create_email(email_type: 'Shipment', event: 'click') }
      1.times { create_email(email_type: 'UserConfirmation', event: 'click') }
      1.times { create_email(email_type: 'GetABookDiscount', event: 'click') }
      visit '/email-events'
    end

    scenario 'it should display total number of emails events' do
      expect(page).to have_content 'Emails sent: 16'
      expect(page).to have_content 'Emails opened: 8'
      expect(page).to have_content 'Emails clicked: 5'
    end

    scenario 'it should display open rate for email type' do
      expect(page).to have_content 'Open rate for Order emails: 40.0%'
      expect(page).to have_content 'Open rate for Shipment emails: 100.0%'
      expect(page).to have_content 'Open rate for UserConfirmation emails: 25.0%'
      expect(page).to have_content 'Open rate for GetABookDiscount emails: 33.33%'
      expect(page).to have_content 'Open rate for ReferAFriend emails: 100.0%'
    end

    scenario 'it should display click rate for email type' do
      expect(page).to have_content 'Click rate for Order emails: 20.0%'
      expect(page).to have_content 'Click rate for Shipment emails: 100.0%'
      expect(page).to have_content 'Click rate for UserConfirmation emails: 25.0%'
      expect(page).to have_content 'Click rate for GetABookDiscount emails: 33.33%'
      expect(page).to have_content 'Click rate for ReferAFriend emails: 0.0%'
    end
  end
end
