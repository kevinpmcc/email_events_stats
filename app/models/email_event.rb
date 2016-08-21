class EmailEvent < ActiveRecord::Base

  def self.event_total(event)
    EmailEvent.where(event: event).count
  end

  def self.event_rate_by_type(email_type:, event:)
    email_events = EmailEvent.all
    sent_emails = email_events.where(event: 'send', email_type: email_type).count
    emails_with_event = email_events.where(event: event, email_type: email_type).count
    ((emails_with_event.to_f / sent_emails) * 100).round(2)
  end

  def self.email_type
    EmailEvent.all.map { |i|
      i.email_type
     }.uniq
  end
end
