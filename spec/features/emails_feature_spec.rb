require 'rails_helper'

feature 'emails' do
  context 'no emails data received' do
    scenario 'it should display heading Email Statistics' do
      visit '/emails'
      expect(page).to have_content 'Email Statistics'
    end
  end

  context 'one email sent event data received' do
    before :each do
      Email.create(address: 'barney@lostmy.name',
                   email_type: 'Shipment',
                   event: 'send',
                   timestamp: '1471429434')
    end 

    scenario 'it should display total number of emails sent' do
      visit '/emails'
      emails_sent = page.find("#emails-sent") 
      expect(emails_sent).to have_content '1'
    end
  end
end
