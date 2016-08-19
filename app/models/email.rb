class Email < ActiveRecord::Base

  def self.event_total(event)
    Email.where(event: event).count
  end  

  def self.event_rate_by_type(email_type: ,event:)
    emails = Email.all
    sent_emails = emails.where(event: 'send', email_type: email_type).count
    emails_with_event = emails.where(event: event, email_type: email_type).count
    (emails_with_event.to_f / sent_emails).round(2)
  end
end
