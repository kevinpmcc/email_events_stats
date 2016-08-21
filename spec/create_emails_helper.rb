def create_email(address: 'fakeperson@lostmyna.me',
                 email_type: 'Order',
                 event: 'send',
                 timestamp: 1471441341)
  Email.create(address: address,
               email_type: email_type,
               event: event,
               timestamp: timestamp) 
end

