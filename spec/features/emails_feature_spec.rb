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

    scenario 'it should display total number of emails sent' do
      visit '/emails'
      emails_sent = page.find("#emails-sent") 
      expect(emails_sent).to have_content '16'
    end

    scenario 'it should display total opened emails' do
      visit '/emails'
      emails_opened = page.find("emails-opened")
      expect(emails_opened).to have_content ' '
    end

    scenario 'it should display total clicks' do
      visit '/emails'
      emails_opened = page.find("emails-opened")
      expect(emails_opened).to have_content ' '
    end
    scenario 'it should display open rate per email type' do
      visit '/emails'
      open_rate_shipment = page.find("open-rate-shipment")
      open_rate_user_confirmation = page.find("open-rate-user-confirmation")
      open_rate_discount = page.find("open-rate-user-discount")
      open_rate_refer = page.find("open-rate-refer")
      open_rate_order = page.find("open-rate-order")
      expect(open_rate_shipment).to have_content ' '
      expect(open_rate_user_confirmation).to have_content ' '
      expect(open_rate_discount).to have_content ' '
      expect(open_rate_refer).to have_content ' '
      expect(open_rate_order).to have_content ' '
    end

    scenario 'it should display open rate per email type' do
      visit '/emails'
      click_rate_shipment = page.find("click-rate-shipment")
      click_rate_user_confirmation = page.find("click-rate-user-confirmation")
      click_rate_discount = page.find("click-rate-user-discount")
      click_rate_refer = page.find("click-rate-refer")
      click_rate_order = page.find("click-rate-order")
      expect(click_rate_shipment).to have_content ' '
      expect(click_rate_user_confirmation).to have_content ' '
      expect(click_rate_discount).to have_content ' '
      expect(click_rate_refer).to have_content ' '
      expect(click_rate_order).to have_content ' '
    end

    scenario 'it should display click rate per email type' do
      visit '/emails'
      emails_opened = page.find("click-rate-shipment")
      expect(emails_opened).to have_content ' '
    end
  end

  def create_email(address: 'fakeperson@lostmyna.me', email_type: 'Order', event: 'send', timestamp: '1471441341') 
    Email.create(address: address, email_type: email_type, event: event, timestamp: timestamp)
  end
end
